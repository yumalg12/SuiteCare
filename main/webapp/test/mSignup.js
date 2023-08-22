let phoneArr = [0,0,0,0,0,0,0,0];
document.addEventListener('keydown', function(event) {
	let now = new Date();
	if (event.keyCode == 192) {
		$("#id").val("member"+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds())
		$("#pw").val("asdf");
		$("#pw_check").val("asdf");
		$("#name").val("간병신청인");
		document.mSignupForm.man.checked = true;
		$("#phone").val("010"+phoneArr.map(e=>e=Math.floor(Math.random()*10)).join(''));
		$("#email").val("member@suitecare.com");
		$("#address").val("(우) 08793 서울 관악구 낙성대역3길 3 (봉천동)");
		}
});
