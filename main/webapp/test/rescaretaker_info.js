let q1 = ["con_y","difficult_com","con_n"];
let q2 = ["meal_self","meal_assistance","Feeding","injection"];
let q3 = ["toilet_self","toilet_assistance","diapers","foley_catheter","stoma"];
let q4 = ["general","hemiplegia","ps_n"];
let q5 = ["mobility_self","cw_assistance","only_bed","mobility_n"];
let q6 = ["b_yes", "b_no"];
let q7 = ["s_yes", "s_no"];
let q8 = ["outpatient_option", "outpatient_yn"];
let q9 = ["caren_yes", "caren_no"];

let qArr = [q1, q2, q3, q4, q5, q6, q7, q8, q9];

document.addEventListener('keydown', function(event) {
	if (event.keyCode == 192) {
		qArr.forEach(e => {
			document.getElementById(e[Math.floor(Math.random() * e.length)]).checked = true;
			console.log(e);
		});
	}
});
