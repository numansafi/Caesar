export function initForm() {
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var form = document.querySelector("form");

  if (checkBoxes) {
    for (const check of checkBoxes) {
      check.addEventListener("change", function () {
        form.submit();
      });
    }
  }
}
