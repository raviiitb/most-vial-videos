
function actionDetermine() {
var selectedCountry = document.getElementById('selectedCountry').value;
var selectedCategory = document.getElementById('selectedCategory').value;
var selectedLimit = document.getElementById('selectedLimit').value;
var formAction;
if (selectedCountry && selectedCategory && selectedLimit)
  formAction = "/country/" + selectedCountry + "/category/" + selectedCategory + "/limit/" + selectedLimit;
else if (selectedCountry && selectedCategory && !selectedLimit)
  formAction = "/country/" + selectedCountry + "/category/" + selectedCategory;
else if (selectedCountry && !selectedCategory && selectedLimit)
  formAction = "/country/" + selectedCountry + "/limit/" + selectedLimit;
else if (!selectedCountry && selectedCategory && selectedLimit)
  formAction = "/category/" + selectedCategory + "/limit/" + selectedLimit;
else if (!selectedCountry && selectedCategory && !selectedLimit)
  formAction = "/category/" + selectedCategory;
else if (!selectedCountry && !selectedCategory && selectedLimit)
  formAction = "/limit/" + selectedLimit;
else if (selectedCountry && !selectedCategory && !selectedLimit)
  formAction = "/country/" + selectedCountry;
$("#selectedOptions").attr("action", formAction);
}


// }
// $("#selected-options").change(actionDetermine() {
//   var formAction = "test";
//   $("#selected-options").attr("action", "/search/" + formAction);
// });


