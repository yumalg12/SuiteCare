document.addEventListener('keydown', function(event) {
	let now = new Date();
	if (event.keyCode == 192) {
		$("#id").val("test"+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds())
		$("#pw").val("asdf");
		$("#pw_check").val("asdf");
		$("#name").val("테스트");
		document.mSignupForm.man.checked = true;
		$("#phone").val("01012341234");
		$("#email").val("test@test.com");
		$("#address").val("(우) 08793 서울 관악구 낙성대역3길 3 (봉천동)");
		}
});
