import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/init_select2';
import { openQRCamera } from "./scan.js";
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { qrCodeActivated } from "./scan.js";
$(document).ready(qrCodeActivated());
import "./question.js";

initMapbox();
initSelect2();
// openQRCamera()

// Il semble qu'il fasse ajouter des listener pour pouvoir utiliser cette structure...
// Le script du lecteur qr est actuellement dans la view...
// import { openQRCamera } from "./scan.js"
// import { showQRIntro } from "./scan.js"
// openQRCamera();
// showQRIntro();

