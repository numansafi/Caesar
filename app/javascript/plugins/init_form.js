import Rails from "@rails/ujs";

export function initForm() {
  window.Rails = Rails;
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var form = document.querySelector("form");

  if (checkBoxes) {
    for (const check of checkBoxes) {
      check.addEventListener("change", function () {
        Rails.fire(form, "submit");
      });
    }
  }
}
