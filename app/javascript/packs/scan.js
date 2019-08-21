const qrCodeActivated = () => {
  const btn = document.querySelectorAll(".qrcode-text-btn")[0].click();
  const field = document.getElementById("qr-field");
  field.addEventListener("change", (node) => {

    console.log(field.value);
    console.log(field);
    const reader = new FileReader();
    reader.onload = function() {
      field.value = "";
      qrcode.callback = function(res) {
        if(res instanceof Error) {
          alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
        } else {
          field.parentNode.previousElementSibling.value = res;
          document.getElementById("qr-code-form").submit();
        };
      };
      qrcode.decode(reader.result);
    };
    reader.readAsDataURL(field.files[0]);

  });
}

export { qrCodeActivated };

