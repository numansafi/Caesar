import swal from "sweetalert";

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector("#sweet-alert-demo");
  const form = document.querySelector("form");
  if (swalButton) {
    // protect other pages
    swalButton.addEventListener("click", (event) => {
      event.preventDefault();
      swal(options).then((callback) => {
        form.submit();
      });
    });
  }
};

export { initSweetalert };
