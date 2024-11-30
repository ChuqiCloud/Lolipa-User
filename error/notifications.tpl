<script type="text/javascript">
	$(function () {
		iziToast.success({
          title: '成功',
          message: '[value]',
        });
		setTimeout(function () {
			var url = '[url]'
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>