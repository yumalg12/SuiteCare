function setArr(arr){
	let selected = arr[Math.floor(Math.random()*arr.length)];
	arr.splice(arr.indexOf(selected),1);
	return selected;
}

document.addEventListener('keydown', function(event) {
	if (event.keyCode == 192) {
		let genderArr = [`document.preferenceForm.man`,`document.preferenceForm.woman`,`document.preferenceForm.anything`];
		setArr(genderArr).checked = true;

		let locArr = ["서울특별시","부산광역시","인천광역시","경기도","제주특별자치도",0];
		document.preferenceForm.pre_location1.value = setArr(locArr);
		document.preferenceForm.pre_location2.value = setArr(locArr);
		document.preferenceForm.pre_location3.value = setArr(locArr);
		
		let serviceArr = ["요리","목욕","재활운동보조","외출동행","청소","빨래","운전",0];
		document.preferenceForm.pre_service1.value = setArr(serviceArr);
		document.preferenceForm.pre_service2.value = setArr(serviceArr);
		document.preferenceForm.pre_service3.value = setArr(serviceArr);
		
		let wageArr = [10000,11000,12000,13000,14000,15000,0,2];
		document.preferenceForm.pre_hourwage1.value = setArr(wageArr);
		document.preferenceForm.pre_hourwage2.value = setArr(wageArr);
		document.preferenceForm.pre_hourwage3.value = setArr(wageArr);
		}
});