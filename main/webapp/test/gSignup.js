function setArr(arr){
	let selected = arr[Math.floor(Math.random()*arr.length)];
	arr.splice(arr.indexOf(selected),1);
	return selected;
}

document.addEventListener('keydown', function(event) {
	let now = new Date();
	if (event.keyCode == 192) {
		$("#id").val("caregiver"+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds())
		$("#pw").val("asdf");
		$("#pw_check").val("asdf");
		document.joinForm.g_birth.value = 
			"19"+(Math.floor(Math.random()*30+60))
			+"-0"
			+(Math.floor(Math.random()*9+1))+"-"
			+(Math.floor(Math.random()*3))
			+(Math.floor(Math.random()*9+1));
		$("#name").val("간병제공인");
		document.joinForm.man.checked = true;
		
		let phoneArr = [0,0,0,0,0,0,0,0];
		$("#phone").val("010"+phoneArr.map(e=>e=Math.floor(Math.random()*10)).join(''));
		
		$("#email").val("caregiver@suitecare.com");
		$("#address").val("(우) 08793 서울 관악구 낙성대역3길 3 (봉천동)");
		
		let serviceArr = ["요리","목욕","재활운동보조","외출동행","청소","빨래","운전",0];
		document.joinForm.g_service1.value = setArr(serviceArr);
		document.joinForm.g_service2.value = setArr(serviceArr);
		document.joinForm.g_service3.value = setArr(serviceArr);

		let locArr = ["서울특별시","부산광역시","인천광역시","경기도","제주특별자치도",0];
		document.joinForm.g_location1.value = setArr(locArr);
		document.joinForm.g_location2.value = setArr(locArr);
		document.joinForm.g_location3.value = setArr(locArr);
		
		let wageArr = [10000,11000,12000,13000,14000,15000,0,2];
		document.joinForm.g_hourwage1.value = setArr(wageArr);
		document.joinForm.g_hourwage2.value = setArr(wageArr);
		document.joinForm.g_hourwage3.value = setArr(wageArr);
		}
});