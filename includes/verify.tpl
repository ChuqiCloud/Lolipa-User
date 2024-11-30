{if $Verify.is_captcha==1}
{if [positon]=='top'}



<div class="row">
    <div class="col-6">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="captcha" {if [id]=='[id]'}id="captcha_[type][id]"{else}id="captcha_[type]"{/if} placeholder="请输入验证码">
                <label for="floatingPassword">请输入验证码</label>
              </div>      
    </div>  
      <div class="col-6">
        <img {if [id]=='[id]'}id="[type][id]"{else} id="[type]"{/if} class="img-fluid" alt="验证码" onClick="getVerify('[type]','[id]')">
      </div>
</div>

{/if}



<script>
  getVerify('[type]','[id]')

</script>
{/if}