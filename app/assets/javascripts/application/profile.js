// TODO: Update the fancy logic in the layout for loading controller-specific stylesheets so we can share this with enrollments
$(document).ready(function() {
  $("input[type=radio]").change(function() {
    $(".form-option-details").hide();
    if(this.checked)
      $("~ .form-option-details", this).show();
  });

  // also showing the current selection details, if there is one
  $("input[type=radio]:checked ~ .form-option-details").show();
});
