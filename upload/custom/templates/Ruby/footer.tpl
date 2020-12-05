						</div>
					</div>
					{if (isset($PAGINATION))}
						<div class="text-center">
							{$PAGINATION}
						</div>
					{/if}
				</div>
			</div>
		</div>
	<div id="sidebar-overlay"></div>
</div>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
		<div class="p-3">
			<h5>Soon 👀</h5>
			<p>Oculto!</p>
		</div>
	</aside>
	
	<footer class="main-footer">
		<div class="float-right d-none d-sm-inline">
			Powered By <a href="https://namelessmc.com" target="_blank" rel="noopener noreferrer">NamelessMC</a>
		</div>
		<strong>Copyright © {'Y'|date} <a href="{$SITE_HOME}">{$SITE_NAME}</a>.</strong>
	</footer>
</div>
<scroll-top></scroll-top>
<all-js >
	{foreach from=$TEMPLATE_JS item=script}
		{$script|replace:"$(document).ready(":"document.addEventListener('customload', "|replace:"oxide":"oxide"}
	{/foreach}
	
	<script>
		window.addEventListener('turbolinks:load', ()=> {

			var Tooltip = document.querySelectorAll('[data-toggle="tooltip"]');
			var Tooltips = [];
			Tooltip.forEach(elementp => {
				var Tooltips = new bootstrap.Tooltip(elementp, {});
			});
			var DropDowsItem = document.querySelectorAll("[data-toggle='dropdown']");
			var dropdown = [];
			DropDowsItem.forEach(elementp => {
				var dropdown = new bootstrap.Dropdown(elementp, {});
				elementp.addEventListener('click', () => {
					var dropdown = new bootstrap.Dropdown(elementp, {});
					dropdown.toggle();
					
					var elementopadre = elementp.parentElement;
					console.debug(elementopadre);
					elementopadre.addEventListener('mouseleave', () => {
						console.debug('[D] Cerrando Dropdown');
						try {
							dropdown.hide();
							
							console.log(elementopadre.querySelector('.dropdown-menu').classList.toggle('show', false));
							console.log(elementopadre.classList.toggle('show', false));
							
						} catch (errort) {
							console.debug('Ocurrio un error al intentar cerrar el dropdown\n ' + errort)	
						}
					})
				})
				dropdown.hide();
			});
			console.log('Loaded?');
			//var PushMenuA = new adminlte.PushMenu($("#flojo"), {});
			if (document.querySelector("#sidebar-overlay")){
				document.querySelector("#sidebar-overlay").addEventListener("click", () => {
					document.querySelector("body").setAttribute('sidebar', "close");
				});
				document.querySelector("[sidebar-toggle]").addEventListener("click", () => {
					document.querySelector("body").setAttribute('sidebar', "open");
				});
			}
		})
	</script>
	{if (isset($tinyMCESET))}
		<script>
			window.addEventListener('turbolinks:load', ()=> {
				//console.clear()
				setTimeout(() => {
					tinyMCE.init({
						selector: '#quickreply',
						browser_spellcheck: true,
						contextmenu: false,
						branding: false,
						menubar: false,
						convert_urls: false,
						plugins: 'autolink,codesample,directionality,emoticons,hr,image,link,lists,spoiler,preview',
						toolbar: 'undo redo | bold italic underline strikethrough fontsizeselect forecolor backcolor ltr rtl | preview | alignleft aligncenter alignright alignjustify | codesample emoticons hr image link numlist bullist | spoiler-add spoiler-remove',
						spoiler_caption: 'Spoiler',
						default_link_target: '_blank',
						skin: "oxide"
					});
				}, 5000);
			})
		</script>
	{/if}
	{if (isset($SELECT2_PLUGINADD))}
		<link rel="stylesheet" href="{$TEMPLATE_PATH}/assets/plugins/select2/css/select2.min.css">
		<link rel="stylesheet" href="{$TEMPLATE_PATH}/assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
		<script src="{$TEMPLATE_PATH}/assets/plugins/select2/js/select2.full.min.js"></script>
		<script>
			var elementos = document.querySelectorAll('.select2');
			elementos.forEach(element => {
				$(element).select2({
					theme: 'bootstrap4'
				})
			});
	   </script>
	{/if}
	{if (isset($BACKEND))}
		<link rel="stylesheet" href="{$TEMPLATE_PATH}/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css">
		<script type="text/javascript" src="{$TEMPLATE_PATH}/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	{/if}
	<script src="https://twemoji.maxcdn.com/v/13.0.1/twemoji.min.js" integrity="sha384-5f4X0lBluNY/Ib4VhGx0Pf6iDCF99VGXJIyYy7dDLY5QlEd7Ap0hICSSZA1XYbc4" crossorigin="anonymous" async></script>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			document.dispatchEvent(new CustomEvent('Cargado'));
		})
		document.addEventListener('turbolinks:load', () => {
			setTimeout(()=>{
				if (document.querySelector('#chartWrapper')) {
					document.querySelector('#chartWrapper>info').remove();
				}
				document.dispatchEvent(new CustomEvent('customload'));
			}, 2000)
		})
		if ('serviceWorker' in navigator) {
			window.addEventListener('load', function() {
				navigator.serviceWorker.register(FRONTEND_CON.SITE_HOMEFULL + 'sw.js').then(function(registration) {
				// Si es exitoso
				console.debug('SW registrado correctamente');
				}, function(err) {
				// Si falla
				console.debug('SW fallo', err);
				});
			});
		}
	</script>
	
</all-js>


</body></html>
