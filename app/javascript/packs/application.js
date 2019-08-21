import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


initMapbox();
initAutocomplete();

// Il semble qu'il fasse ajouter des listener pour pouvoir utiliser cette structure...
// Le script du lecteur qr est actuellement dans la view...
import { qrCodeActivated } from "./scan.js"
qrCodeActivated();
