import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { openQRCamera } from "./scan.js";
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


initMapbox();
initAutocomplete();
openQRCamera()

// Il semble qu'il fasse ajouter des listener pour pouvoir utiliser cette structure...
// Le script du lecteur qr est actuellement dans la view...
// import { openQRCamera } from "./scan.js"
// import { showQRIntro } from "./scan.js"
// openQRCamera();
// showQRIntro();
