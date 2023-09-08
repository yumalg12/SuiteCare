let name1Arr = ["김","이","박","최","정","강","조","윤","장","임","한","오","서","신","권","황","안","송","류","전","홍","고","문","양","손","배","백","허","유","남","심","노","하","곽","성","차","주","우","구","라","민","진","지","엄","채","방","공","현","함","염","여","추","도","소","석","선","설","마","길","표","명","기","반","왕","맹","제","모","탁","어","은","편","예","봉"];
let name2Arr = ["갑","강","건","걸","견","결","겸","경","계","공","관","광","구","국","권","귀","규","균","근","금","기","길","남","대","덕","도","동","두","득","래","량","명","문","미","민","병","복","서","선","성","수","숙","순","애","양","연","옥","완","용","우","욱","원","윤","익","인","자","장","재","제","조","주","진","청","춘","택","하","한","행","혁","현","화","회","효","후","훈","흥","희"];

let genArr = ["man", "woman"];

let diagnosisArr = [
    "치매", "골절", "당뇨", "고혈압", 
    "백내장", "폐렴", "심장질환", "신장질환",
    "류마티스 관절염",  "중풍", "뇌졸중", 
    '알츠하이머', '파킨슨병', '대장암', '위암',
    "골다공증","디스크","관절염"
];

document.addEventListener('keydown', function(event) {
	if (event.keyCode == 192) {
		$("#t_name").val(name1Arr[Math.floor(Math.random()*(name1Arr.length - 1))]+name2Arr[Math.floor(Math.random()*(name2Arr.length - 1))]+name2Arr[Math.floor(Math.random()*(name2Arr.length - 1))]);
		$("#t_age").val(Math.floor(Math.random()*50)+50);
		$("#t_height").val(Math.floor(Math.random()*80)+120);
		$("#t_weight").val(Math.floor(Math.random()*120)+30);
		$("#diagnosis").val(diagnosisArr[Math.floor(Math.random()*diagnosisArr.length)]);
		document.getElementById(genArr[Math.floor(Math.random() * genArr.length)]).checked = true;
    }
});