<!-- <link rel="shortcut icon" href="/themes/clientarea/default/assets/images/favicon.ico"> -->
{if $TplName != 'configureproduct' }
{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<link href="/themes/clientarea/Lolipa-User/assets/css/bootstrap.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
{else}
{/if}
{else}
<link href="/themes/clientarea/Lolipa-User/assets/css/bootstrap.cartconfig.css?v={$Ver}" rel="stylesheet" type="text/css" />
{/if}
<link href="/themes/clientarea/default/assets/css/icons.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<link href="/themes/clientarea/Lolipa-User/assets/css/app.min.css?v=1145141" rel="stylesheet" type="text/css" />
{else}
{/if}
{if($load_css=load_css('custom.css'))}
<link href="{$load_css}?v=114514" rel="stylesheet" type="text/css" />
{/if}
<!-- 自定义全局样式 -->
<link href="/themes/clientarea/default/assets_custom/css/global.css?v=114514" rel="stylesheet" >
<link href="/themes/clientarea/default/assets_custom/css/responsive.css?v={$Ver}" rel="stylesheet">
<!-- 字体图标 -->
<link href="/themes/clientarea/default/assets_custom/fonts/iconfont.css?v={$Ver}" rel="stylesheet">

<!-- JAVASCRIPT -->
<script src="/themes/clientarea/default/assets/libs/jquery/jquery.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/Lolipa-User/assets/libs/bootstrap/js/bootstrap.bundle.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/metismenu/metisMenu.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/simplebar/simplebar.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/node-waves/waves.min.js?v={$Ver}"></script>

<!-- <script src="/themes/clientarea/default/assets/libs/error-all/solve-error.js" type="text/javascript"></script> -->
<!-- 自定义js -->
<script src="/themes/clientarea/default/assets_custom/js/throttle.js?v={$Ver}"></script>

<link type="text/css" href="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.css?v={$Ver}" rel="stylesheet" />
<link href="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" rel="stylesheet">
<script src="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
<script src="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.js?v={$Ver}"></script>
<link rel="stylesheet" href="/themes/clientarea/Lolipa-User/style/css/register.css?v=11451419198101">

<!-- 监控 -->
