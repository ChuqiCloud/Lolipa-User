{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<title>{$Title} - {$Setting.company_name}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="{$Setting.web_seo_keywords}" />
	<meta name="description" content="{$Setting.web_seo_desc}" />
	<meta content="{$Setting.company_name}" name="author" />
	<link rel="shortcut icon" href="https://cloud.lolipa.cn/themes/web/Loli/assets/img/favicon.ico" />
	{include file="includes/head"}
  <script>
	var setting_web_url = ''
  var language={:json_encode($_LANG)};
  </script>
	{php}$hooks=hook('client_area_head_output');{/php}
	{if $hooks}
		{foreach $hooks as $item}
			{$item}
		{/foreach}
	{/if}
<style>
    .logo-lg img{
      width:150px;
      height:auto;
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
						{if $site.minilogo !=''}
						<span class="logo-sm">
							<img src="{$Setting.web_logo_home}" alt="" height="32">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="" height="17">
						</span>
					</a>

					<a href="{$Setting.web_jump_url}" class="logo logo-light">
						{if $site.minilogo !=''}
						<span class="logo-sm" style="overflow: hidden;">
							<img src="{$Setting.web_logo_home}" alt="" height="32">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="">
						</span>
					</a>
				</div>

				<button type="button" class="btn btn-sm px-3 font-size-16 header-item" id="vertical-menu-btn">
					<i class="fas fa-indent"></i>
				</button>
                 <a href="clientarea"><button type="button" class="btn btn-sm ml-3 px-3 font-size-16 header-item" id="vertical-menu-btn">
					<i class="far fa-desktop"></i> 总览</button></a>
			</div>

			<div class="d-flex">
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
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="knowledgebase">
					<button type="button" class="btn header-item noti-icon">
						<i class="bx bx-help-circle"></i>
					</button>
					帮助</a>
				</div> 
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="supporttickets">
					<button type="button" class="btn header-item noti-icon">
						<i class="bx bx-detail"></i>
					</button>
					工单</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="message">
						<button type="button" class="btn header-item noti-icon">
							<i class="bx bx-bell {if $Setting.unread_num}bx-tada{/if}" style="margin-top: 6px;"></i>
							{if $Setting.unread_num != '0'}
							<span class="badge badge-danger badge-pill">{$Setting.unread_num}</span>
							{/if}
						</button>消息
					</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="transaction">
					<button type="button" class="btn header-item noti-icon">
						<i class="bx bx-dollar-circle"></i>
					</button>
					费用</a>
				</div>
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="cart?action=viewcart">
					<button type="button" class="btn header-item noti-icon">
						<i class="bx bx-cart-alt" style="margin-top: 6px;"></i>
							<!-- {if count($CartShopData) != '0'}
							<span class="badge badge-danger badge-pill">{:count($CartShopData)}</span>
							{/if} -->
					</button>
					购物车</a>
				</div> 
				{if $Setting.allow_user_language}
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<a>
						<img id="header-lang-img" src="/upload/common/country/{$LanguageCheck.display_flag}.png" alt="Header Language" height="16">
						{$LanguageCheck.display_name}</a>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						{php}
							$parse = parse_url(request()->url());
							$path=$parse['path'];
							$query=$parse['query'];
							$query = preg_replace('/&language=[a-zA-Z0-9_-]+/','',$query);
						{/php}
						{if $path=="/addons"}
							{foreach $Language as $key=>$list}
								<a href="?{if $query}{$query}&{/if}language={$key}" class="dropdown-item notify-item language" data-lang="zh-cn">
									<img src="/upload/common/country/{$list.display_flag}.png" alt="user-image"
										 class="mr-1" height="12"> <span class="align-middle">{$list.display_name}</span>
								</a>
							{/foreach}
							{else/}
							{foreach $Language as $key=>$list}
								<a href="?{if $query}{$query}&{/if}language={$key}" class="dropdown-item notify-item language" data-lang="zh-cn">
									<img src="/upload/common/country/{$list.display_flag}.png" alt="user-image"
										 class="mr-1" height="12"> <span class="align-middle">{$list.display_name}</span>
								</a>
							{/foreach}
						{/if}

					</div>
				</div>
				{/if}
				{if $Userinfo}
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item d-inline-flex align-items-center"
						id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="user-center_header d-inline-flex align-items-center justify-content-center"
							style="display: inline-block;width: 30px;height: 30px;font-size: 16px;">
							{if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))} 
							  {$Userinfo.user.username|substr=0,1|upper} 
							{elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))} 
							  {$Userinfo.user.username|substr=0,3}
							{else}
							  {$Userinfo.user.username|substr=0,1|upper} 
							{/if}
						</div>
						<span class="d-none d-xl-inline-block ml-1" key="t-henry">{$Userinfo.user.username}</span>
						<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<!-- item-->
						<a class="dropdown-item" href="details">
							<i class="bx bxs-user-detail font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.personal_information}</span>
						</a>
						<a class="dropdown-item" href="security">
							<i class="bx bx-cog font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.security_center}</span>
						</a>
						<a class="dropdown-item" href="message">
							<i class="bx bxl-messenger font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.message_center}</span>
						</a>
						{if $Setting.certifi_open==1}
						<a class="dropdown-item" href="verified"> 
							<i class="bx bxs-id-card font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.real_name_authentications}</span>
						</a>
						{/if}
						<a class="dropdown-item text-danger" href="logout"><i
								class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span
								key="t-logout">{$Lang.log_out}</span></a>
					</div>
				</div>
				{else}
				<div class="pointer d-flex align-items-center">
					<a href="/login" style="color: white;">{$Lang.please_login}</a>
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