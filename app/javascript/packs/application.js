import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { openQRCamera } from "./scan.js"
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


initMapbox();
openQRCamera()
