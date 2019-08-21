// const qrCodeActivated = () => {
//   const to_send = document.getElementById("field-to-send")
//   const field = document.getElementById("qr-field");
//   field.addEventListener("change", (node) => {

//     console.log(field.value);
//     console.log(field);
//     const reader = new FileReader();
//     reader.onload = function() {
//       field.value = "";
//       qrcode.callback = function(res) {
//         if(res instanceof Error) {
//           console.log("no");
//           alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
//         } else {
//           console.log("yes");
//           field.parentNode.previousElementSibling.value = res;
//           to_send.value = res;
//           document.querySelectorAll(".qr-code-form")[0].submit();
//         };
//       };
//       qrcode.decode(reader.result);
//     };
//     reader.readAsDataURL(field.files[0]);

//   });
// }

// export { qrCodeActivated };

