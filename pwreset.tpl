<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-dns-prefetch-control" content="on" />
    <link rel="dns-prefetch" href="//lib.baomitu.com" />
    <title>{$Title} | {$Setting.company_name}</title>
    <link rel="shortcut icon" href="/favicon.ico?v={$Ver}" />
    <link rel="stylesheet" href="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/twitter-bootstrap/5.2.3/css/bootstrap.min.css">
    <script src="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/twitter-bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/vue/3.2.45/vue.global.prod.js"></script>
    <script src="https://mirrors.sustech.edu.cn/cdnjs/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="/themes/clientarea/default/assets/libs/metismenu/metisMenu.min.js?v={$Ver}"></script>
    <script src="/themes/clientarea/default/assets/libs/simplebar/simplebar.min.js?v={$Ver}"></script>
    <script src="/themes/clientarea/default/assets/libs/node-waves/waves.min.js?v={$Ver}"></script>
    <script src="/themes/clientarea/default/assets_custom/js/throttle.js?v={$Ver}"></script>
    <link type="text/css" href="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.css?v={$Ver}" rel="stylesheet" />
    <script src="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.js?v={$Ver}"></script>
    <script src="/themes/clientarea/default/assets/js/public.js?v={$Ver}" type="text/javascript"></script>
    <script>var setting_web_url = '{$Setting.web_url}';var language={:json_encode($_LANG)};</script>
    <script>{php}$hooks=hook('client_area_head_output');{/php}{if $hooks}{foreach $hooks as $item}{$item}{/foreach}{/if} </script>    
    <script type="text/javascript">var mk = '{$Setting.msfntk}';</script>
</head>
<body style="background: url(https://www.lolipa.cn/cloud/0fe0e87076fe4723a9063241309df58e.jpeg) no-repeat;background-position: center;background-attachment: fixed;background-size: cover;">
<div id="app">
  <div class="container" style="margin-top: 200px;">
  <div class="row g-3 justify-content-center">
       <!-- 左侧Card -->
      <div class="col-md-4 d-none d-md-block d-xl-block">
              <div class="card mb-2" style="background-color: rgb(255 255 255 / 92%);">
                  <div class="card-body">
                    <h6 class="card-title">{{card1_title}}</h6>
                    <p class="card-subtitle text-muted mb-2">2022-12-28 15:54</p>
                    <p class="card-text">最新活动</p>
                    <a
                      href="/cart"
                      rel="noopener"
                      target="_blank"
                      class="card-link"
                    >
                      前往查看 &gt;&gt;
                    </a>
                  </div>
              </div>

              <div class="card mb-2" style="background-color: rgb(255 255 255 / 92%);">
                  <div class="card-body">
                    <h6 class="card-title">{{card2_title}}</h6>
                    <p class="card-subtitle text-muted mb-2">2022-12-28 17:36</p>
                    <p class="card-text">QEMU版本已从6.2.0升级至7.0.0，为您带来更好的性能体验！</p>
                    <a
                      href="/cart"
                      rel="noopener"
                      target="_blank"
                      class="card-link"
                    >
                      前往查看 &gt;&gt;
                    </a>
                  </div>
              </div>                    

              <div class="card mb-2" style="background-color: rgb(255 255 255 / 92%);">
                  <div class="card-body">
                    <h6 class="card-title">{{card3_title}}</h6>
                    <p class="card-subtitle text-muted mb-2">2022-12-28 18:36</p>
                    <p class="card-text">处理器采用R9-5950X高主频处理器</p>
                    <a
                      href="/cart?fid=5&gid=9"
                      rel="noopener"
                      target="_blank"
                      class="card-link"
                    >
                      前往查看 &gt;&gt;
                    </a>
                  </div>
              </div> 
              
      </div>
       <!-- 判断是手机号还是邮箱 -->
       <div class="col-md-4" style="display: block;" id="check_one">

        <div class="card text-center" style="background-color: rgb(255 255 255 / 92%);">
          <div class="card-body m-md-3">
              <form action="/login?action=email" method="post">
                  <img class="mb-4 mt-4" src="{$CustomDepot.logo_2}" alt="Lolipa" style="width: 200px;">
              
                  <h6 class="mb-4 fw-normal text-muted">{{Title}}</h6>


              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="check_input" placeholder="邮箱/手机号">
                <label for="floatingInput">邮箱/手机号</label>
              </div>            
                
                  <button class="w-100 btn btn-primary mb-2" type="button" id="check">继续</button>
                </form>                    
              <hr> 
                  <a href="/register">暂无账号？点我注册</a>
            <!-- 第三方登录预留位置 -->
          </div>
        </div>

       </div>             
       <!-- 邮箱找回 -->
       <div class="col-md-4" id="email_pwreset" style="display: none;">

        <div class="card text-center" style="background-color: rgb(255 255 255 / 92%);">
          <div class="card-body m-md-3">
              <form action="/pwreset?action=email" method="post" name="email_js">
                  <img class="mb-4 mt-4" src="{$CustomDepot.logo_2}" alt="Lolipa" style="width: 200px;">
              
                  <h6 class="mb-4 fw-normal text-muted">{{Title}}</h6>


              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="emailInp" name="email" value="{$Post.email}" placeholder="{$Lang.please_enter_your}邮箱">
                <label for="floatingInput">{$Lang.please_enter_your}邮箱</label>
              </div>
              
<div class="row">
    <div class="col-6">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="code" name="code" value="{$Post.code}" placeholder="请输入验证码">
                <label for="floatingPassword">请输入验证码</label>
              </div>      
    </div>  
      <div class="col-6">
        <button class="w-100 btn btn-lg btn-primary mb-2" id="getcode_" name="getcode" onclick="return false;" style="font-size: 18px;
    margin-top: 6px;">获取验证码</button>
      </div>
</div>     

              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="emailPwd" name="password" placeholder="密码">
                <label for="floatingPassword">请输入新密码</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="emailPwdCheck" name="checkPassword" placeholder="再次输入新密码">
                <label for="floatingPassword">再次输入新密码</label>
              </div>              

              {if $Verify.allow_email_forgetpwd_captcha==1}
              {include file="includes/verify"  type="allow_email_forgetpwd_captcha" positon="top"}
              {/if}             

                  <button class="w-100 btn btn-primary mb-2" type="submit" onclick="if(!beforeSubmit(this)) {return false;};">重置密码</button>
                </form>                    
              <hr> 
                  <button class="w-100 btn btn-primary mb-2" type="button" onclick="javascript:window.location.href='/login' ">返回登录账号</button>
          </div>
        </div>

       </div>
       <!-- 手机找回 -->
       <div class="col-md-4" id="phone_pwreset" style="display: none;">

        <div class="card text-center" style="background-color: rgb(255 255 255 / 92%);">
          <div class="card-body m-md-3">
              <form action="/pwreset?action=phone" method="post" name="email_js">
                  <img class="mb-4 mt-4" src="{$CustomDepot.logo_2}" alt="Lolipa" style="width: 200px;">
              
                  <h6 class="mb-4 fw-normal text-muted">{{Title}}</h6>


              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="phoneInp" name="phone" value="{$Post.phone}" placeholder="{$Lang.please_enter_your}手机号">
                <label for="floatingInput">{$Lang.please_enter_your}手机号</label>
              </div>
              
<div class="row">
    <div class="col-6">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="code" name="code" value="{$Post.code}" placeholder="请输入验证码">
                <label for="floatingPassword">请输入验证码</label>
              </div>      
    </div>  
      <div class="col-6">
        <button class="w-100 btn btn-lg btn-primary mb-2" onclick="getCode(this,'reset_phone_send','allow_phone_forgetpwd_captcha');return false;" style="font-size: 18px;
    margin-top: 6px;">获取验证码</button>
      </div>
</div>     

              <div class="form-floating mb-3">
                <input type="password" class="form-control" name="password" id="phonePwd" placeholder="密码">
                <label for="floatingPassword">请输入新密码</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" name="checkPassword" id="phonePwdCheck" placeholder="再次输入新密码">
                <label for="floatingPassword">再次输入新密码</label>
              </div>              

              {if $Verify.allow_phone_forgetpwd_captcha==1}
              {include file="includes/verify"  type="allow_phone_forgetpwd_captcha" positon="top"}
              {/if}          

                  <button class="w-100 btn btn-primary mb-2" type="submit">重置密码</button>
                </form>                    
              <hr> 
                  <button class="w-100 btn btn-primary mb-2" type="button" onclick="javascript:window.location.href='/login' ">返回登录账号</button>
          </div>
        </div>

       </div>                       



    </div>
</div>

</div>

</body>

<script src="/themes/clientarea/Lolipa-User/assets_Lolipa/pwreset.js?v={$Ver}"></script>

</html>