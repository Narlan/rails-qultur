import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { openQRCamera } from "./scan.js";
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { qrCodeActivated } from "./scan.js";
$(document).ready(qrCodeActivated());
import "./question.js";
import { select2InUserIndex } from '../plugins/init_select2';
import "./level-up.js";
import { mapNavigation } from './navigation';
$(document).ready(mapNavigation());
import "./modal-gift.js";
import "./loading-bar.js";

select2InUserIndex();
initMapbox();
var Turbolinks = require("turbolinks");
Turbolinks.start();
