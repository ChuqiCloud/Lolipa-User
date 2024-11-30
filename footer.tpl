{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
</div>
</div>
</div>
{if $TplName == 'configureproduct' || $TplName == 'viewcart' }
{else}
<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				&copy; {$Setting.company_name}.
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block">
					
				</div>
			</div>
		</div>
	</div>
</footer>
{/if}
{/if}
<script src="/themes/clientarea/default/assets/js/app.js?v={$Ver}"></script>
{php}$hooks=hook('client_area_footer_output');{/php}
{if $hooks}
	{foreach $hooks as $item}
		{$item}
	{/foreach}
{/if}
</body>

</html>
<script type="text/javascript">
	$(function() {
	    $("a").each(function() {
	        $(this).text() === " Powered by ©智简魔方" && $(this).remove();
	    });
	});
</script>