import mapboxgl from 'mapbox-gl';

console.log("Entered: init_mapbox")

const buildMonument = (map, monumentId, modelOrigin, modelAltitude, modelRotate, modelScale, modelUrl) => {

    // transformation parameters to position, rotate and scale the 3D model onto the map
    var modelTransform = {
      translateX: mapboxgl.MercatorCoordinate.fromLngLat(modelOrigin, modelAltitude).x,
      translateY: mapboxgl.MercatorCoordinate.fromLngLat(modelOrigin, modelAltitude).y,
      translateZ: mapboxgl.MercatorCoordinate.fromLngLat(modelOrigin, modelAltitude).z,
      rotateX: modelRotate[0],
      rotateY: modelRotate[1],
      rotateZ: modelRotate[2],
      scale: modelScale
    };

    var THREE = window.THREE;

    // configuration of the custom layer for a 3D model per the CustomLayerInterface
    var customLayer = {
      id: monumentId,
      type: 'custom',
      renderingMode: '3d',
      onAdd: function(map, gl) {
      this.camera = new THREE.Camera();
      this.scene = new THREE.Scene();

      // create two three.js lights to illuminate the model
      var directionalLight = new THREE.DirectionalLight(0xffffff);
      directionalLight.position.set(0, -70, 100).normalize();
      this.scene.add(directionalLight);

      var directionalLight2 = new THREE.DirectionalLight(0xffffff);
      directionalLight2.position.set(0, 70, 100).normalize();
      this.scene.add(directionalLight2);

      // use the three.js GLTF loader to add the 3D model to the three.js scene
      var loader = new THREE.GLTFLoader();
      loader.load(modelUrl, (function (gltf) {
      this.scene.add(gltf.scene);
      }).bind(this));
      this.map = map;
      console.log(loader);

      // use the Mapbox GL JS map canvas for three.js
      this.renderer = new THREE.WebGLRenderer({
      canvas: map.getCanvas(),
      context: gl,
      antialias: true
    });

    this.renderer.autoClear = false;
    },
    render: function(gl, matrix) {
      var rotationX = new THREE.Matrix4().makeRotationAxis(new THREE.Vector3(1, 0, 0), modelTransform.rotateX);
      var rotationY = new THREE.Matrix4().makeRotationAxis(new THREE.Vector3(0, 1, 0), modelTransform.rotateY);
      var rotationZ = new THREE.Matrix4().makeRotationAxis(new THREE.Vector3(0, 0, 1), modelTransform.rotateZ);

      var m = new THREE.Matrix4().fromArray(matrix);
      var l = new THREE.Matrix4().makeTranslation(modelTransform.translateX, modelTransform.translateY, modelTransform.translateZ)
      .scale(new THREE.Vector3(modelTransform.scale, -modelTransform.scale, modelTransform.scale))
      .multiply(rotationX)
      .multiply(rotationY)
      .multiply(rotationZ);

      this.camera.projectionMatrix.elements = matrix;
      this.camera.projectionMatrix = m.multiply(l);
      this.renderer.state.reset();
      this.renderer.render(this.scene, this.camera);
      this.map.triggerRepaint();
    }
    };
    return customLayer;
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();

    markers.forEach((marker) => {

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('https://github.com/Narlan/rails-qultur/blob/master/app/assets/images/map-marker-monument.png?raw=true')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '30px';
      element.style.height = '38px';

      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });

    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    console.log("Detected: map div")
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    var map = window.map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    zoom: 4.5,
    center: [2.213749, 46.227638],
    pitch: 35,
    antialias: true // create the gl context with MSAA antialiasing, so custom layers are antialiased
    });

    // ARC
    // parameters to ensure the model is georeferenced correctly on the map
    var modelOrigin = [2.29503, 48.872928];
    var modelAltitude = 0;
    var modelRotate = [Math.PI / 2, 180.2, 0];
    var modelScale = 1000.41843220338983e-8;
    var modelUrl = 'https://raw.githubusercontent.com/Narlan/rails-qultur/master/public/gltfs/arc.gltf';

    const customLayer = buildMonument(map, 'arc', modelOrigin, modelAltitude, modelRotate, modelScale, modelUrl);

    // EIFFEL
    var modelOrigin2 = [2.294481, 48.858350];
    var modelAltitude2 = 0;
    var modelRotate2 = [Math.PI / 2, 179.9, 0];
    var modelScale2 = 530.41843220338983e-8;
    var modelUrl2 = 'https://raw.githubusercontent.com/Narlan/rails-qultur/master/public/gltfs/eiffel.gltf';

    const customLayer2 = buildMonument(map, 'eiffel', modelOrigin2, modelAltitude2, modelRotate2, modelScale2, modelUrl2);

    map.on('style.load', function() {
      map.addLayer(customLayer, 'waterway-label');
      map.addLayer(customLayer2, 'waterway-label');
    });

    map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
    enableHighAccuracy: true
  },
    trackUserLocation: true
  }));

  const markers = JSON.parse(mapElement.dataset.markers);

  fitMapToMarkers(map, markers);
  } else {
    console.log("Not detected: map div")
  }
};


export { initMapbox };
