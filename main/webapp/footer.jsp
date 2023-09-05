<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
			</ul>
		</div>
	</footer>

<div class="copyright">
	Made with <a href="https://templated.co/">Templated</a>.
</div>

<!-- Scripts -->
<script>
var header = document.querySelector("header");
var banner = document.querySelector(".banner");

if (!banner) {
	window.addEventListener('scroll', function() {
	    if (window.scrollY < 110) {
	        header.classList.add('alt');
	        header.classList.remove('reveal');
	    } else {
	        header.classList.add('reveal');
	        header.classList.remove('alt');
	    }
	});
};
</script>
	
	<script src="${context}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${context}/assets/js/skel.min.js"></script>
	<script src="${context}/assets/js/util.js"></script>
	<script src="${context}/assets/js/main.js"></script>