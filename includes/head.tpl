<!-- <link rel="shortcut icon" href="/themes/clientarea/default/assets/images/favicon.ico"> -->
{if $TplName != 'configureproduct' }
{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<link href="/themes/clientarea/Lolipa-User/assets/css/bootstrap.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
{else}
{/if}
{else}
<link href="/themes/clientarea/Lolipa-User/assets/css/bootstrap.min1.css?v={$Ver}" rel="stylesheet" type="text/css" />
{/if}
<link href="/themes/clientarea/default/assets/css/icons.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
<link href="/themes/clientarea/Lolipa-User/assets/css/app.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
{else}
{/if}
{if($load_css=load_css('custom.css'))}
    <link href="{$load_css}?v={$Ver}" rel="stylesheet" type="text/css" />
{/if}
<!-- 自定义全局样式 -->
<link href="/themes/clientarea/default/assets_custom/css/global.css?v={$Ver}" rel="stylesheet" >
<link href="/themes/clientarea/default/assets_custom/css/responsive.css?v={$Ver}" rel="stylesheet">
<!-- 字体图标 -->
<link href="/themes/clientarea/default/assets_custom/fonts/iconfont.css?v={$Ver}" rel="stylesheet"> 

<!-- JAVASCRIPT -->
<script src="/themes/clientarea/default/assets/libs/jquery/jquery.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/bootstrap/js/bootstrap.bundle.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/metismenu/metisMenu.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/simplebar/simplebar.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/node-waves/waves.min.js?v={$Ver}"></script>

<!-- <script src="/themes/clientarea/default/assets/libs/error-all/solve-error.js" type="text/javascript"></script> -->
<!-- 自定义js -->
<script src="/themes/clientarea/default/assets_custom/js/throttle.js?v={$Ver}"></script>

<link type="text/css" href="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.css?v={$Ver}" rel="stylesheet" />
<script src="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.js?v={$Ver}"></script>
<link rel="stylesheet" href="/themes/clientarea/Lolipa-User/style/css/register.css?v={$Ver}">




