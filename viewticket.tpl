
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url=""}
{/if}

{include file="includes/modal"}
<link href="/themes/clientarea/default/assets/libs/bootstrap-rating/bootstrap-rating.css?v={$Ver}"
	rel="stylesheet" />
	<script>
		
	function adminScore(rid, type) {
		const star = $(`#starRating${rid}`).val();
		const obj = {
			rid,
			type,
			star,
			tid: '{$Think.get.tid}'
		}
		$.ajax({
			type: "post",
			url: '/ticket/evaluate',
			data: obj,
			success: function (data) {
				if (data.status !== 200) {
					iziToast.success({
                      title: '成功',
                      message: data.msg,
                    });
					return
				}
				iziToast.success({
                  title: '成功',
                  message: data.msg,
                });
				$(`#starRating${rid}`).attr("disabled", true);
			}
		});
	}
	</script>
<div class="row">
	<div class="col-12">
		<div class="card mb-3">


			<h4 class="card-title mb-0 p-3">
				<span class="mr-2 px-3 py-2 badge badge-dark"
					style="background-color: {$ViewTicket.ticket.status.color};">{$ViewTicket.ticket.status.title}</span>
				#{$ViewTicket.ticket.tid} - {$ViewTicket.ticket.title}

				{if $ViewTicket.ticket.status.id != "4"}
				<div class="ticket-actions float-sm-right mt-3 mt-sm-0">
					<a href="javascript: getModal('ticket/close', '{$Lang.close_work_order}', '{$Lang.close_the_job}', {tid: {$ViewTicket.ticket.tid}, token: '{$Token}'}, function(){location.href = '/supporttickets'});"
						class="btn btn-danger btn-sm">
						<i class="fas fa-times fa-fw"></i>
						{$Lang.close_work_order}
					</a>
				</div>
				{/if}
			</h4>
			<p class="px-3 mb-0">{$Lang.creation_time}：{$ViewTicket.ticket.create_time|date="Y-m-d H:i"}</p>
			<div class="d-flex p-3">
				<span class="mr-3">对接部门：{$ViewTicket.ticket.department.name}</span>
				{if $ViewTicket.ticket.host}<br>相关产品：{$ViewTicket.ticket.host}{/if}
			</div>

		</div>

		<div class="card-body p-0" style="background-color: #f4f5f8;">
			{foreach $ViewTicket.list as $reply}
			<div class="ticket-reply card mb-3 {if $reply.admin}admin{/if}">
				<div class="post-by">
					<div class="post-user">
						<span class="mr-2 badge badge-{if $reply.admin}primary{else}success{/if}">{$reply.user_type}</span>
						{$reply.realname}
					</div>
					<div class="post-date">
						{$reply.format_time}
					</div>
				</div>
				<div class="message p-3">
					<div>{$reply.content}</div>
					{if $reply.attachment}
					<div>{$Lang.enclosure}：</div>
					{foreach $reply.attachment as $attachments}
					<div>
						<a href="http://{$attachments}" target="_blank">{:substr($attachments,strpos($attachments,"^")+1)}</a>
					</div>
					{/foreach}
					{/if}

					{if $reply.admin}
					<div class="justify-content-end align-items-center"
						style="display:{$ViewTicket.feedback_request == '0'?none:flex}">
						<input type="hidden" class="rating" id="starRating{$reply.id}" data-filled="mdi mdi-star text-warning"
							data-empty="mdi mdi-star-outline text-muted" onchange="adminScore('{$reply.id}','{$reply.type}')" {if
							$reply.star !='0' } disabled {/if} value="{$reply.star}" />
					</div>
					{/if}
				</div>
			</div>
			{/foreach}
		</div>

		{if $ViewTicket.ticket.status.id != "4"}
		<div class="card" id="ticketReplyContainer">
			<form method="post" enctype="multipart/form-data">
				<input type="hidden" name="tid" value="{$ViewTicket.ticket.tid}" />
				<input type="hidden" name="c" value="{$ViewTicket.ticket.c}" />
				<div class="card-body">
					<h4 class="card-title">{$Lang.reply}</h4>
					<div class="form-group">
						{include file="includes/summernote" height="200"}
						<textarea class="form-control" id="content" name="content" rows="10"
							placeholder="{$Lang.please_enter_question}"></textarea>
					</div>
					<div class="form-group">
						<label class="form-control-label" for="formrow-firstname-input">{$Lang.enclosure}</label>
						<!-- {include file="supporttickets/supporttickets-customfields"} -->
						<div class="row" id="filelist">
						 	<div class="col-12 mb-2 filebox d-flex justify-content-between">
						 		<input type="file" class="form-control-file w-75" name="attachments[]">
						 		<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
						 	</div>
						</div>
						<a class="btn btn-success mt-2" id="addFileBtn" onclick="addFileBtn()">{$Lang.add_more}</a>
					</div>
					<div class="row">
						<div class="col-lg-3 col-xs-6">
							<button type="submit" id="support" class="btn btn-primary btn-block">{$Lang.reply_work_order}</button>
						</div>
						<div class="col-lg-3 col-xs-6">
							<a href="supporttickets" class="btn btn-block btn-default">{$Lang.cancel}</a>
						</div>
					</div>

				</div>
			</form>
		</div>
		{else}
        <div class="card" id="ticketReplyContainer">
            <div class="card-body">
              <h4 class="card-title">此工单已关闭</h4>
              <p class="card-text">此工单已关闭，您不能再在此工单发布回复。如有需要，请<a href="/submitticket">提交新工单</a>，或点击下方按钮重新开启工单。</p>
              <form method="post" enctype="multipart/form-data">
                <input type="hidden" name="tid" value="{$ViewTicket.ticket.tid}" />
                <input type="hidden" name="c" value="{$ViewTicket.ticket.c}" />
                <input type="hidden" id="content" name="content" value="用户重新开启了工单。"></input>
                <div class="mdui-card-actions">
                    <button type="submit" class="btn btn-primary"><i class="bx bxs-bell-plus"></i> 重新开启工单</button>
                    <a href="/submitticket" class="btn btn-outline-secondary">提交新工单</a>
                </div>
              <form>
            </div>
        </div>
        {/if}
	</div>

</div>
<script src="/themes/clientarea/default/assets/libs/bootstrap-rating/bootstrap-rating.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/js/rating-init.js?v={$Ver}"></script>
<script>

	function addFileBtn()
	{
		// 添加更多附件
		var fileHtml = `
			<div class="col-12 mb-2 filebox d-flex justify-content-between">
				<input type="file" class="form-control-file w-75" name="attachments[]">
						<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
			</div>
	`
		$('#filelist').append(fileHtml)

	};

	// 删除附件
	$('#filelist').on('click', '.deletefileBtn', function () {
		$(this).parent('.filebox').remove()
	});
</script>

<script>
    function handleButtonClick() {
        setTimeout(function() {
            support.disabled = true;
            iziToast.info({
              title: '成功',
              message: "你的回复已提交，请等待跳转",
            });
        }, 200);
    }
 
    document.addEventListener('DOMContentLoaded', function() {
        var support = document.getElementById('support');
        support.addEventListener('click', handleButtonClick);
    });
</script>