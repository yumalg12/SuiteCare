let phoneArr = [0,0,0,0,0,0,0,0];
let genArr = ["man", "woman"];
let name1Arr = ["김","이","박","최","정","강","조","윤","장","임","한","오","서","신","권","황","안","송","류","전","홍","고","문","양","손","배","백","허","유","남","심","노","하","곽","성","차","주","우","구","라","민","진","지","엄","채","방","공","현","함","염","여","추","도","소","석","선","설","마","길","표","명","기","반","왕","맹","제","모","탁","어","은","편","예","봉"];
let name2Arr = ["갑","강","건","걸","견","결","겸","경","계","공","관","광","구","국","권","귀","규","균","근","금","기","길","남","대","덕","도","동","두","득","래","량","명","문","미","민","병","복","서","선","성","수","숙","순","애","양","연","옥","완","용","우","욱","원","윤","익","인","자","장","재","제","조","주","진","청","춘","택","하","한","행","혁","현","화","회","효","후","훈","흥","희"];

document.addEventListener('keydown', function(event) {
	let now = new Date();
	if (event.keyCode == 192) {
		$("#id").val("m"+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds())
		$("#pw").val("asdf");
		$("#pw_check").val("asdf");
		$("#name").val("간병신청인");
		$("#name").val(name1Arr[Math.floor(Math.random()*(name1Arr.length - 1))]+name2Arr[Math.floor(Math.random()*(name2Arr.length - 1))]+name2Arr[Math.floor(Math.random()*(name2Arr.length - 1))]);
		document.getElementById(genArr[Math.floor(Math.random() * genArr.length)]).checked = true;
		$("#phone").val("010"+phoneArr.map(e=>e=Math.floor(Math.random()*10)).join(''));
		$("#email").val("member@suitecare.com");
		$("#address").val("(우) 08793 서울 관악구 낙성대역3길 3 (봉천동)");
		}
});
