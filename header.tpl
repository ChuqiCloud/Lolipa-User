{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<title>{if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}{$Title} - {$CartConfig.product.name} - {$Setting.company_name}{else}{$Title} - {$Setting.company_name}{/if}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="{$Setting.web_seo_keywords}" />
	<meta name="description" content="{$Setting.web_seo_desc}" />
	<meta content="{$Setting.company_name}" name="author" />
	<link rel="shortcut icon" href="/favicon.ico" />
	{include file="includes/head"}
<script>
	var setting_web_url = ''
var language={:json_encode($_LANG)}                                                                                                                                                                  ;
</script>
	{php}$hooks=hook('client_area_head_output');{/php}
	{if $hooks}
		{foreach $hooks as $item}
			{$item}
		{/foreach}
	{/if}
<style>
.logo-lg img{
width:150px                                                                                                                                                                                          ;
height:auto                                                                                                                                                                                          ;
}
</style>
</head>
<body data-sidebar="dark">

	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
					<a href="{$Setting.web_jump_url}" class="logo logo-dark">
						{if $Setting.logo_url_home_mini !=''}
						<span class="logo-sm">
							<img src="{$Setting.logo_url_home_mini}" alt="logo" height="17">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="logo" height="17">
						</span>
					</a>

					<a href="{$Setting.web_jump_url}" class="logo logo-light">
						{if $Setting.logo_url_home_mini !=''}
						<span class="logo-sm" style="overflow: hidden;">
							<img src="{$Setting.logo_url_home_mini}" alt="logo" height="17">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="logo" height="17">
						</span>
					</a>
				</div>
				<button type="button" class="btn btn-sm px-3 font-size-16 header-item" id="vertical-menu-btn">
					<i class="fas fa-indent"></i>
				<!--
				</button>
<a href="clientarea"><button type="button" class="btn btn-sm ml-3 px-3 font-size-16 header-item" id="vertical-menu-btn">
					<i class="far fa-desktop"></i> 总览</button></a>
				-->
			</div>

			<div class="d-flex">
			 <!--
				<div class="dropdown d-inline-block mr-3 phonehide">
					<button type="button" class="btn header-item noti-icon" id="page-header-search-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				 <input type="text" class="zdy-ss" placeholder="搜索" aria-label="Recipient's username" autocomplete="off">
						<i class="mdi mdi-magnify zd-ssan"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-search-dropdown">
					 <div class="form-group m-0">
					 <form action="/helpsearch.html">
					 <div class="header-search-droplist">
					 <input type="search" class="zdy-ss zdy-tcss" name="search" placeholder="输入您想要搜索的关键词" aria-label="Recipient's username" autocomplete="off">
					 <button class="btn zdy-ssan" type="submit">
					 <i class="mdi mdi-magnify"></i>
					 </button>
					 <ul>
					 <li class="to-page">
					 <div class="search-block" data-href="/product/ecs.html" target="_blank">
					 <p class="text">
					 <span>云服务器</span>直达热门产品</p>
					 <div class="search-tag">
					 <a class="tag-console" target="_blank" href="/service?groupid=305">控制台</a>
					 <a href="/product/ecs.html" class="tag-product" target="_blank">产品</a></div>
					 </div>
					 </li>
					 {foreach $keyword as $key =>$tag}
					 <li><a href="/helpsearch.html?search={$tag}" target="_blank">
					 <span>{$tag}</span></a>
					 </li>
					 {/foreach}
					 </ul>
					 </div>
					 </form>
					 </div>
					</div>
				</div>-->
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="knowledgebase">
					<button type="button" class="btn header-item noti-icon">
						{if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}
					 <i class="bx bx-help-circle" style="padding-top: 0.5em;"></i>
					 {else}
					 <i class="bx bx-help-circle" style="margin-top: 8px;"></i>
					 {/if}
					</button>
					帮助</a>
				</div> 
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="supporttickets">
					<button type="button" class="btn header-item noti-icon">
						{if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}
					 <i class="bx bx-detail" style="padding-top: 0.5em;"></i>
					 {else}
					 <i class="bx bx-detail" style="margin-top: 8px;"></i>
					 {/if}
					</button>
					工单</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="message">
						<button type="button" class="btn header-item noti-icon">
						 {if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}
					 <i class="bx bx-bell {if $Setting.unread_num}bx-tada{/if}" style="padding-top: 0.5em;"></i>
					 {else}
					 <i class="bx bx-bell {if $Setting.unread_num}bx-tada{/if}" style="margin-top: 8px;"></i>
					 {/if}
							{if $Setting.unread_num != '0'}
							<span class="badge badge-danger badge-pill">{$Setting.unread_num}</span>
							{/if}
						</button>消息
					</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="transaction">
					<button type="button" class="btn header-item noti-icon">
						{if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}
					 <i class="bx bx-dollar-circle" style="padding-top: 0.5em;"></i>
					 {else}
					 <i class="bx bx-dollar-circle" style="margin-top: 8px;"></i>
					 {/if}
					</button>
					费用</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="cart?action=viewcart">
					<button type="button" class="btn header-item noti-icon">
					 {if $TplName == 'configureproduct' && !empty($CartConfig.product.name)}
					 <i class="bx bx-cart-alt" style="padding-top: 0.5em;"></i>
					 {else}
					 <i class="bx bx-cart-alt" style="margin-top: 8px;"></i>
					 {/if}
							<!-- {if count($CartShopData) != '0'}
							<span class="badge badge-danger badge-pill">{:count($CartShopData)}</span>
							{/if} -->
					</button>
					购物车</a>
				</div>

				{if $Userinfo}
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect d-inline-flex align-items-center"
						id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="user-center_header d-inline-flex align-items-center justify-content-center"
							style="display: inline-block;width: 30px;height: 30px;font-size: 16px;">
							{if $Userinfo.user.qq != ''}
								<img style="width: 40px;border-radius: 50%;padding: 5px" src="https://q1.qlogo.cn/g?b=qq&nk={$Userinfo.user.qq}&s=100">
							{else}
								<img style="width: 40px;border-radius: 50%;padding: 5px" src="/themes/clientarea/Lolipa-User/assets/images/avatar.svg">
							{/if}
						</div>
						<span class="d-none d-xl-inline-block ml-1" key="t-henry">{$Userinfo.user.username}</span>
						<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right user-header">
						<!-- item-->
						<div class="ml-20">
							<a href="/details">
							<div class="media">
								<div class="media-body ml-3 hostz-center" style="color:#000;">
									<label class="font-size-16 mt-2 mb-1" style="font-weight:bold;">{if $Userinfo.user.email!=''}{$Userinfo.user.email}{else}{$Userinfo.user.phonenumber}{/if}</label>
									<div><label>{if $Userinfo.user.companyname!=''}{$Userinfo.user.companyname}{else}{$Userinfo.user.username}{/if}</label></div>
								</div>
							</a>
							</div>
						</div>
						<div style="padding: 15px;">
							<div direction="row" class="css-1ik5lam">
								<div class="fr-uc-ac-info">
									<div class="ac-status">
										<div class="status-cube {if $Userinfo.user.certifi.status==1}real-name{/if}"></div>
											<div>{if $Userinfo.user.certifi.status!=1}未实名{else}已完成实名{/if}</div>
										</div>
									<div class="ac-name">主账号</div>
								</div>
								<div class="fr-uc-ba-info">
									<div>
										<div>账户余额</div>
											<div class="info">
												<span class="balance">{$Userinfo.user.credit}</span>
												<span>元</span>
											</div>
									</div>
									<div>
										<a href="/addfunds" style="color:#fff;" >
											<span class="charge-btn">充值</span>
										</a>
									</div>
								</div>
							</div>
							<div class="css-1p8i5ne">
								<div class="fr-uc-flex-wrapper">
									<a href="/billing">
										<div class="fr-ur-action-box">
											<i class="bx bx-dollar-circle  fr-uc-action-icon"></i>
											<div>财务中心</div>
										</div>
									</a>
									<a href="/security">
										<div class="fr-ur-action-box">
											<i class="bx bx-check-shield fr-uc-action-icon"></i>
											<div>安全中心</div>
										</div>
									</a>
									<a href="/apimanage">
										<div class="fr-ur-action-box">
											<i class="bx bx-check-double fr-uc-action-icon"></i>
											<div>{if $Userinfo.allow_resource_api == '1'}接口状态{else}接口开通{/if}</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<ul class="css-1kris7m">
							{if $Setting.allow_user_language}
								<li>切换语言
									<div class="lang">
									{foreach $Language as $key=>$list}
									<a href="?{$query}&language={$key}" data-lang="zh-cn">
										<span>
											<span class="lang-icon"></span>
											<img src="/upload/common/country/{$list.display_flag}.png" alt="user-image" class="mr-1" height="12">
										</span>
									</a>
									{/foreach}
									</div>
								</li>
							{/if}
						</ul>
						<a href="logout">
							<div class="css-1u3r55r" style="padding: 15px;">
								<div class="fr-uc-exit-wrapper">
									<span>退出账号</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				{else}
				<div class="pointer d-flex align-items-center">
					<a href="/login" class="text-dark">{$Lang.please_login}</a>
				</div>
				{/if}
			</div>
		</div>
	</header>

	{include file="includes/menu"}

	<div class="main-content">
		<div class="page-content">
			{if $TplName != 'clientarea'}
			{include file="includes/pageheader"}
			{/if}
			<div class="container-fluid">
				{/if}
