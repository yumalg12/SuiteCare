$(document).ready(() => {
  const selectBoxes = document.getElementsByTagName("select");

  Array.from(selectBoxes).forEach((e) => {
	e.setAttribute("onchange", 'javascript:disableSelectedValue(this)');
  });
  
});

	function disableSelectedValue(element) {
		  const selectBoxes = element.parentElement.querySelectorAll('select');
		  const selectedVals = [selectBoxes[0].value, selectBoxes[1].value, selectBoxes[2].value];
		  //console.log(selectedVals);

		  selectBoxes.forEach((e) => {
		    if (e !== element) {
		      Array.from(e.options).forEach((option) => {
		        if (selectedVals.includes(option.value) && option.value != '1' && option.value != '0' && option.value != '지정하지 않음') {
		          option.disabled = true;
		        } else {
		          option.disabled = false;
		        }
		      });
		    }
		  });
		}