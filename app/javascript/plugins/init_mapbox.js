import mapboxgl from 'mapbox-gl';

console.log("Entered: init_mapbox")

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    console.log("Detected: map div")

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    var map = window.map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v10',
    zoom: 17.5,
    center: [2.294481, 48.858370],
    pitch: 60,
    antialias: true // create the gl context with MSAA antialiasing, so custom layers are antialiased
    });

    // parameters to ensure the model is georeferenced correctly on the map
    var modelOrigin = [2.294481, 48.858370];
    var modelAltitude = 0;
    var modelRotate = [Math.PI / 2, 180, 0];
    var modelScale = 550.41843220338983e-8;

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
    id: '3d-model',
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
    loader.load('https://raw.githubusercontent.com/Narlan/rails-qultur/master/public/gltfs/eiffel.gltf', (function (gltf) {
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

    map.on('style.load', function() {
    map.addLayer(customLayer, 'waterway-label');
    });

    map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
    enableHighAccuracy: true
  },
    trackUserLocation: true
  }));

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      });
    fitMapToMarkers(map, markers);
  } else {
    console.log("Not detected: map div")
  }
};



export { initMapbox };
