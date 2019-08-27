import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';


mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

// added manualy
const arc = {
  lng: 2.294946,
  lat: 48.873756
};
const eiffelTower = {
  lng: 2.294481,
  lat: 48.858370
};
let start = [arc.lng, arc.lat];
let final = [eiffelTower.lng, eiffelTower.lat];
const focus = {
  lng: 2.333333,
  lat: 48.866667
};

// From Mapbox API
const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v10',
  center: [focus.lng, focus.lat], // starting position
  zoom: 12
});
// set the bounds of the map
const bounds = [[(focus.lng - 2), focus.lat - 2], [focus.lng + 2, focus.lat + 2]];
map.setMaxBounds(bounds);

// initialize the map canvas to interact with later
const canvas = map.getCanvasContainer();

// an arbitrary start will always be the same
// only the end or destination will change



// create a function to make a directions request
const getRoute = (end) => {
  // make a directions request using cycling profile
  // an arbitrary start will always be the same
  // only the end or destination will change
  // let start = [-122.662323, 45.523751];
  var url = 'https://api.mapbox.com/directions/v5/mapbox/cycling/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + mapboxgl.accessToken;

  // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
  var req = new XMLHttpRequest();
  req.responseType = 'json';
  req.open('GET', url, true);
  req.onload = function() {
    var data = req.response.routes[0];
    var route = data.geometry.coordinates;
    var geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    };
    // if the route already exists on the map, reset it using setData
    if (map.getSource('route')) {
      map.getSource('route').setData(geojson);
    } else { // otherwise, make a new request
      map.addLayer({
        id: 'route',
        type: 'line',
        source: {
          type: 'geojson',
          data: {
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'LineString',
              coordinates: geojson
            }
          }
        },
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    }
    // add turn instructions here at the end
  };
  req.send();
};

map.on('load', function() {
  // make an initial directions request that
  // starts and ends at the same location
  getRoute(start);

  // Add starting point to the map
  map.addLayer({
    id: 'point',
    type: 'circle',
    source: {
      type: 'geojson',
      data: {
        type: 'FeatureCollection',
        features: [{
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'Point',
            coordinates: start
          }
        }
        ]
      }
    },
    paint: {
      'circle-radius': 10,
      'circle-color': '#3887be'
    }
  });
});


// on click we load way to destination

// map.on('click', function(e) {
//   var coordsObj = e.lngLat;



// Test on select change on form
const selection = document.querySelector('select');
selection.addEventListener('change', (e) => {
  const monument = document.querySelector('select').value;
  const array = JSON.parse("[" + monument + "]");
  const coordsObj = { lng: array[0], lat: array[1] };

  //code à conserver
  canvas.style.cursor = '';
  var coords = Object.keys(coordsObj).map(function(key) {
    return coordsObj[key];
  });
  var end = {
    type: 'FeatureCollection',
    features: [{
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'Point',
        coordinates: coords
      }
    }
    ]
  };
  if (map.getLayer('end')) {
    map.getSource('end').setData(end);
  } else {
    map.addLayer({
      id: 'end',
      type: 'circle',
      source: {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: [{
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'Point',
              coordinates: coords
            }
          }]
        }
      },
      paint: {
        'circle-radius': 10,
        'circle-color': '#f30'
      }
    });
  }
  getRoute(coords);
});

// this is where the code for the next step will go

// initMapbox();

// const form = document.querySelector('#fetch');

// form.addEventListener('submit', (e) => {
//   e.preventDefault();
//   const input = document.querySelector('#search-input').value;
//   console.log(input);
//   fetch("https://api.mapbox.com/directions/v5/mapbox/driving/-73.989%2C40.733%3B-74%2C40.733.json?access_token=pk.eyJ1IjoieWV5dGNoaSIsImEiOiJjanlvOGQ2N3kweXdlM2Rub2o3dmI4ZDU1In0.WBwFFzjBi4OlcAtg9q91yw")
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data);
//     });
// });
