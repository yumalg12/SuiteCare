function movePage(section, page, element) {
	let position = element.closest('section').id;
	let pathName = document.location.pathname;
	let path = pathName + "?" + section + "=" + page + "#" + position;
	location.href=path;
}