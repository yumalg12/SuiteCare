function setArr(arr){
	let selected = arr[Math.floor(Math.random()*arr.length)];
	arr.splice(arr.indexOf(selected),1);
	return selected;
}

let genArr = ["man", "woman", "anything"];

document.addEventListener('keydown', function(event) {
	if (event.keyCode == 192) {
		let genderArr = [`document.preferenceForm.man`,`document.preferenceForm.woman`,`document.preferenceForm.anything`];
		setArr(genderArr).checked = true;

		let locArr = ["서울특별시","부산광역시","인천광역시","경기도","제주특별자치도",0];
		document.preferenceForm.pre_location_1.value = setArr(locArr);
		document.preferenceForm.pre_location_2.value = setArr(locArr);
		document.preferenceForm.pre_location_3.value = setArr(locArr);
		
		let ageArr = ["30~34","35~39","40~44","45~49","50~54","55~59","60~64","65~69",0];
		document.preferenceForm.pre_age_1.value = setArr(ageArr);
		document.preferenceForm.pre_age_2.value = setArr(ageArr);
		document.preferenceForm.pre_age_3.value = setArr(ageArr);
		
		document.getElementById(genArr[Math.floor(Math.random() * genArr.length)]).checked = true;

		let serviceArr = ["요리","목욕","재활운동보조","외출동행","청소","빨래","운전",0];
		document.preferenceForm.pre_repre_1.value = setArr(serviceArr);
		document.preferenceForm.pre_repre_2.value = setArr(serviceArr);
		document.preferenceForm.pre_repre_3.value = setArr(serviceArr);
		
		let wageArr = [10000,11000,12000,13000,14000,15000,0];
		document.preferenceForm.pre_hourwage_1.value = setArr(wageArr);
		document.preferenceForm.pre_hourwage_2.value = setArr(wageArr);
		document.preferenceForm.pre_hourwage_3.value = setArr(wageArr);
		}
		
		let preferArr = ["선호지역","선호나이대","선호성별","선호서비스","시급"];
		document.preferenceForm.rank1.value = setArr(preferArr);
		document.preferenceForm.rank2.value = setArr(preferArr);
		document.preferenceForm.rank3.value = setArr(preferArr);
		document.preferenceForm.rank4.value = setArr(preferArr);
		document.preferenceForm.rank5.value = setArr(preferArr);
});