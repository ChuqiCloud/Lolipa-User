<script src="/themes/clientarea/default/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
<script>
  $(function () {
    var credit = '{$ClientArea.index.client.credit}' // 余额
    var unpaid = '{$ClientArea.index.invoice_unpaid}' // 未支付
    var creditNum = parseFloat(credit.replace('{$Lang.element}', ''))
    var unpaidNum = parseFloat(unpaid.replace('{$Lang.element}', ''))

    var percentage = parseFloat(creditNum / (creditNum + unpaidNum)).toFixed(2)

    if (creditNum === 0 || (creditNum === 0 && unpaidNum === 0)) {
      percentage = 0
    }
    var myChart = echarts.init(document.getElementById("balanceCharts"));
    var
      option = {
        title: {
          text: '{a|' + credit + '}\n\n{c|' + '{$Lang.current_balance}' + '}',
          x: 'center',
          y: 'center',
          textStyle: {
            rich: {
              a: {
                fontSize: 16,
                color: '#007bfc'
              },
              c: {
                fontSize: 12,
                color: '#000000',
                padding: [5, 0]
              },

            }
          }
        },
        series: [
          {
            type: 'gauge',
            radius: '80%',
            clockwise: true,
            startAngle: '270',
            endAngle: '-89.9999',
            //调整间隔距离
            splitNumber: 0,
            detail: {
              offsetCenter: [0, -20],
              formatter: ' '
            },
            pointer: {
              show: false
            },
            axisLine: {
              show: true,
              lineStyle: {
                color: [
                  [0, '#228cfc'],
                  //计算比例
                  [percentage, '#228cfc'],

                  [1, '#efefef']
                ],
                width: 9
              }
            },
            axisTick: {
              show: false
            },
            splitLine: {
              show: false,
              length: 32,
              lineStyle: {
                color: '#fff',
                width: 6
              }
            },
            axisLabel: {
              show: false
            }
          }
        ]
      };
    myChart.setOption(option, true);
    
    // echarts 随屏幕大小改变大小
    window.addEventListener("resize",function () {
      myChart.resize();
    });

    // 资源列表
    getSourceList()
  })

  function getSourceList() {
    $('#sourceListBox').html(`<div class="h-100 d-flex align-items-center justify-content-center">{$Lang.data_loading}......</div>`)
    $.ajax({
      type: "get",
      url: '/clientarea',
      data: {
        action: 'list'
      },
      success: function (data) {
        $('#sourceListBox').html(data)
      }
    });
  }

        	let xhr = new XMLHttpRequest();
        	// 调用这个对象的open方法,设置请求方式和请求地址.
        	// get请求的参数直接拼接在url地址上. 
        	xhr.open('get', 'https://www.lolipa.cn/api/getip1.php');
        	// 设置请求成功后的回调函数.
        	xhr.onload = function() {
        		var check_back = document.getElementById("getip");
        		check_back.innerHTML = '最近登录IP：' + xhr.response;
        	}
        	// 调用这个对象的send方法,开始发送. 
        	xhr.send();
        	
        	
        	let xhr1 = new XMLHttpRequest();
        	// 调用这个对象的open方法,设置请求方式和请求地址.
        	// get请求的参数直接拼接在url地址上. 
        	xhr1.open('get', 'https://www.lolipa.cn/api/gettime1.php');
        	// 设置请求成功后的回调函数.
        	xhr1.onload = function() {
        		var check_back = document.getElementById("gettime");
        		check_back.innerHTML = '最近登录时间：' + xhr1.response;
        	}
        	// 调用这个对象的send方法,开始发送. 
        	xhr1.send();        	
        	

</script>
<div class="row">
  <!-- start：个人信息 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_h300">
		<h4 class="card-title mt-0">用户信息</h4>
      <div class="h-100">
        <div class="d-flex align-items-center justify-content-around flex-column mt-3">
          <div class=" d-flex align-items-center justify-content-center zdudb">
            <div class="zdusertx">
              <div class="mr-4 d-flex align-items-center justify-content-center user-center_header">
                {if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))} 
                  {$Userinfo.user.username|substr=0,1|upper} 
                {elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))} 
                  {$Userinfo.user.username|substr=0,3}
                {else}
                  {$Userinfo.user.username|substr=0,1|upper} 
                {/if}
              </div>
            </div>
            <div class="ml-3 zduxx">
              <div class="zduserxx">
				<span>尊敬的客户，您好！</span>
                <span class="user-center_name"><a href="/details">{$Userinfo.user.username}</a></span>
				<span><a title="您的用户组级别为：{$Userinfo.client_group.group_name|default="普通用户"}" class="zdyhz" style="background:{$Userinfo.client_group.group_colour|default="#666"};"><i class="bx bxs-user-detail"></i>{$Userinfo.client_group.group_name|default="普通用户"}</a></span>
                <span>账户ID：{$Userinfo.user.id}</span>
                <span>账户邮箱：{$Userinfo.user.email}</span>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-center justify-content-between zduserlj mt-020">
             {if $Userinfo.user.certifi.status == 1}
			  <a href="/verified" class="zdcg" title="{if $certifi_company.status eq 1}已企业认证{else}已个人认证{/if}">
			    <i class="bx bx-id-card"></i>
			    {if $certifi_company.status eq 1}企业认证{else}个人认证{/if}
			  </a>
			  {else/}
			  <a href="/verified" class="" title="您还未实名认证">
			    <i class="bx bx-id-card"></i>
			     未实名认证
			  </a>
			  {/if}
            <a href="security" class="{if $Userinfo.user.certifi.status==1}zdcg{/if}" title="{if $Userinfo.user.certifi.status==1}已设置密保{else}未设置密保{/if}">
              <i class="bx bx-check-shield"></i>
			  设置密保
            </a>
            <a href="security" class="{if $Userinfo.user.phonenumber}zdcg{/if}" title="{if $Userinfo.user.phonenumber}已绑定手机{else}未绑定手机{/if}">
              <i class="bx bx-phone-call"></i>
			  绑定手机
            </a>
            <a href="security" class="{if $Userinfo.user.email}zdcg{/if}" title="{if $Userinfo.user.email}已绑定邮箱{else}未绑定邮箱{/if}">
              <i class="bx bx-mail-send"></i>
			  绑定邮箱
            </a>
          </div> 
		  <div class="d-flex align-items-center justify-content-between zduserdl mt-4">
		  	<a href="security" id="gettime">:D 获取中...</a>
		  	<a href="security" id="getip">:D 获取中...</a>
		  	
		  	
		  </div> 
        </div>
      </div>
    </div>
  </section>

  <!-- start：财务信息 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_h300">
		<h4 class="card-title mt-0">财务信息</h4>
      <div class="h-75">
	  <div class="zdcwxx mt-020 zdpd">
		<div class="zdye">
		<span class="d-inline-flex fz-12 text-black-50 mb-2">{$Lang.current_balance}</span>
	    <span class="d-inline-flex fz-14 text-black-80">{$ClientArea.index.client.credit}</span>
		</div>
		{if $zduser.is_open_credit_limit eq 1}
		<div class="zdxy">
			<span class="d-inline-flex fz-12 text-black-50 mb-2">可用额度</span>
			<span class="d-inline-flex fz-14 text-black-80">{$zduser.credit_limit_balance}</span>
			<span class="d-inline-flex fz-12 text-black-50 ml-2">总额度:{$zduser.credit_limit}</span>
		</div>
		{/if}
	  </div>
	  <div class="zdcc zdpd">
          <span>
          {if $ClientArea.index.allow_recharge == '1'}
          <a href="/addfunds" class="btn btn-primary mt-020 w-75">{$Lang.recharge}</a>
          {/if}
         </span>
	  </div>
	  {if $zduser.is_open_credit_limit eq 1}
	  <div class="zdcc zdr">
	      <span>账单日：<a href="/credit">{$zduser.bill_generation_date|date="m-d"}</a></span>
		  <span class="ml-3">还款日：<a href="/credit">{$zduser.repayment_date|date="m-d"}</a></span>
	  </div>
	  {/if}
	  
      </div>
	  <div class="d-flex justify-content-between align-items-center h-25 zdpd">
		<a href="billing">账单列表</a>
	    <a href="transaction?action=recharge_record&sort=&orderby=&page=&limit=">充值记录</a>
		<a href="transaction">消费记录</a>
		<a href="transaction?action=refund_record&sort=&orderby=&page=&limit=">退款记录</a>
		<a href="invoicelist">发票管理</a>
		{if $zduser.is_open_credit_limit eq 1}
		<a href="credit">信用管理</a>{/if}
	  </div>
    </div>
  </section>
  <section class="col-md-12 col-xl-4 xfxx">
    <div class="card card-body user-center_h300">
		<h4 class="card-title mt-0">消费信息</h4>
      <div class="d-flex h100p">
        <div class="d-flex flex-column align-items-center justify-content-center flex1">
          <div class="w-100 h-100 d-flex justify-content-center" id="balanceCharts"></div>
        </div>
        <div class="d-flex flex-column justify-content-center flex1">
          <span class="d-inline-flex fz-12 text-black-50 mb-2">{$Lang.records_of_consumption}</span>
          <span class="d-inline-flex fz-14 text-black-80">{$Lang.consumption_this_month}：{$ClientArea.index.intotal}</span>
          <span class="d-inline-flex fz-12 text-black-50 mt-5 mb-2">{$Lang.order_records}</span>
          <span class="d-inline-flex fz-14 text-black-80">{$Lang.unpaid}：{$ClientArea.index.invoice_unpaid}</span>
         
        </div>
      </div>
    </div>
  </section>

  <section class="col-md-12 col-xl-12">
    <div class="card card-body">
      <h4 class="card-title mt-0">代办事项</h4>
	  <div class="user-center_product_grid justify-content-around align-items-center zddbsx mt-3 mb-2">
	    <a href="supporttickets">
	      <div class="text-center text-warning">{$ClientArea.index.ticket_count}</div>
	      <span>{$Lang.pending_work_order}</span>
	    </a>
	    <a href="billing">
	      <div class="text-center text-warning">{$ClientArea.index.order_count}</div>
	      <span>{$Lang.unpaid_order}</span>
	    </a>
	    <a href="service?groupid=304">
	      <div class="text-center text-warning">{$ClientArea.index.host}</div>
	      <span>已订购{$Lang.number_of_products}</span>
	    </a>
		<a href="service?groupid=304">
		  <div class="text-center text-warning">{$ClientArea.product_num_day_7}</div>
		  <span>7天内到期业务数量</span>
		</a>
		<a href="service?groupid=304">
		  <div class="text-center text-warning">{$ClientArea.product_num_day_30}</div>
		  <span>30天内到期业务数量</span>
		</a>
		<a href="service?groupid=304">
		  <div class="text-center text-warning">{$ClientArea.product_money_day_30}</div>
		  <span>30天内到期业务金额</span>
		</a>
	  </div>
    </div>
  </section>
  <!-- start：已开通产品 -->
  <section class="col-md-12 col-xl-12">
    <div class="card card-body">
      <h4 class="card-title mt-0">{$Lang.products_launched_all}</h4>
      <div class="user-center_product_grid mt-3 mb-2" style="overflow-y: auto;">
        {foreach $ClientArea.index.host_nav as $list}
        <a href="service?groupid={$list.id}" class="user-center_product">
          <span>
            <i class="bx bxs-grid-alt"></i>
            {$list.groupname}
          </span>
          <span>({$list.count})</span>
        </a>
        {/foreach}
      </div>
    </div>
  </section>

  <!-- start：资源列表 -->
  <section class="col-md-12 col-xl-8">
    <div class="card card-body user-center_calc" id="sourceListBox">
    </div>
  </section>


  <!-- start：公告通知 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_calc">
      <h4 class="mb-4 card-title d-flex justify-content-between">
        <span>{$Lang.announcement}</span>
        <a href="news" class="fs-12 font-weight-normal">{$Lang.view_more}</a>
      </h4>
      <div class="user-center_notice h100p">
        <ul class="user-center_notice_ul pl-0 mt-3">
          {if $ClientArea.index.news}
          {foreach $ClientArea.index.news as $list}
          <li class="user-center_notice_item">
            <span class="notice_item_time text-black-50">{$list.push_time|date="Y-m-d H:i"}</span>
            <a href="newsview?id={$list.id}" class="notice_item_title">{$list.title}</a>
          </li>
          {/foreach}
          {else}
          <tr>
            <td colspan="2">
              <div class="no-data">{$Lang.nothing}</div>
            </td>
          </tr>
          {/if}
        </ul>
      </div>
    </div>
  </section>
</div>