$(document).ready(() => {
  const liarr = document.getElementById("res-progress").getElementsByTagName("li");
  
  let zindex = liarr.length + 1;

  const urlParams = new URLSearchParams(window.location.search);
  const tname = urlParams.get("tname");
  
  const hrefs = [
    "rescaretaker.jsp",
    "rescaretaker_info.jsp?tname="+tname,
    "rescareloc.jsp?tname="+tname,
    "res_date.jsp?tname="+tname,
    "matchService.jsp?tname="+tname,
  ];

  Array.from(liarr).forEach((e, i) => {
    e.style.zIndex = zindex--;
	//e.setAttribute("onclick", 'javascript:' + (tname ? `location.href='${hrefs[i]}'` : `(() => alert('간병 서비스를 받으실 분을 먼저 선택하세요.'))()`));
	//테스트용 코드. 추후 제거하거나 업데이트할 예정
  });
  
});
