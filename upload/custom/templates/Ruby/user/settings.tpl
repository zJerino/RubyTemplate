{assign var="SELECT2_PLUGINADD" value="true"}
{assign var="USER_PANEL" value="true"}
{include file='header.tpl'}

<div class="card card-primary card-outline">
	<div class="card-body">
		{if (isset($LOGGED_IN_USER))}
			<div class="d-flex flex-column">
				<span id="avatar-chido" class="text-center">
					<img src="{$LOGGED_IN_USER.avatar}"  class="img-circle img-size-90" alt="{$LOGGED_IN_USER.username}" srcset="{$LOGGED_IN_USER.avatar}">
				</span>
				<span class="text-center d-flex flex-column">
					<a href="{$LOGGED_IN_USER.profile}" style="{$LOGGED_IN_USER.username_style}">
						{$LOGGED_IN_USER.username}
					</a>
					<small class="text-gray">
						{$LOGGED_IN_USER.user_title}
					</small>
				</span>
			</div>
		{/if}
	</div>
</div>

{if isset($ERRORS)}
    {foreach from=$ERRORS item=error}
        <div class="alert alert-danger">
            {$error}
        </div>                                
    {/foreach}
{/if}
{if $SUCCESS}
    <div class="alert alert-success">
        {$SUCCESS}
    </div>
{/if}


<div class="card card-primary card-outline card-outline-tabs">
    <div class="card-header p-0 border-bottom-0">
      <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true"><i class="fa fa-house-user"></i> {$SETTINGS}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false"><i class="fa fa-user-lock"></i> {$CHANGE_PASSWORD} & {$EMAIL_ADDRESS}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="custom-tabs-four-messages-tab" data-toggle="pill" href="#custom-tabs-four-messages" role="tab" aria-controls="custom-tabs-four-messages" aria-selected="false"><i class="fa fa-user-shield"></i> 2FA</a>
        </li>
      </ul>
    </div>
    
    <div class="card-body">
      <div class="tab-content" id="custom-tabs-four-tabContent">
        <div class="tab-pane fade  show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
           <form action="" method="post">
            <div class="form-group">
                
                {foreach from=$PROFILE_FIELDS item=field}
                    <div class="form-group">
                        {if !isset($field.disabled)}
                            <label for="input{$field.id}">{$field.name}{if $field.required}<super style="color: red;">*</super>{/if}</label>
                            {if $field.type == "text"}
                                <input type="text" class="form-control" name="{$field.id}" id="input{$field.id}" value="{$field.value}" placeholder="{$field.name}">
                            {elseif $field.type == "textarea"}
                                <textarea class="form-control" name="{$field.id}" id="input{$field.id}">{$field.value}</textarea>
                            {elseif $field.type == "date"}
                                <input name="{$field.id}" id="input{$field.id}" value="{$field.value}" type="text" class="form-control datepicker">
                            {/if}

                        {/if}
                    </div>
                {/foreach}

                  <label>{$ACTIVE_LANGUAGE}</label>
                  <select class="form-control select2" name="language" style="width: 100%;">
                    {foreach from=$LANGUAGES item=language}
                        <option value="{$language.name}"{if $language.active == true} selected="selected"{/if}>{$language.name}</option>
                    {/foreach}
                  </select>
                </div>
                <div class="form-group">
                  <label>{$TIMEZONE}</label>
                  <select class="form-control select2" name="timezone" style="width: 100%;">
                    {foreach from=$TIMEZONES item=timezone key=key}
                        <option value="{$key}"{if $SELECTED_TIMEZONE === $key} selected="selected"{/if}>
                            ({$timezone.offset}) - {$timezone.name} ({$timezone.time})
                        </option>
                    {/foreach}
                  </select>
                </div>
                
                {if isset($PRIVATE_PROFILE)}
                    <div class="form-group">
                        <label for="inputPrivateProfile">{$PRIVATE_PROFILE}</label>
                        <select name="privateProfile" class="form-control select2" id="inputPrivateProfile">
                            <option value="1"{if $PRIVATE_PROFILE_ENABLED == true} selected {/if}>{$ENABLED}</option>
                            <option value="0"{if $PRIVATE_PROFILE_ENABLED == false} selected {/if}>{$DISABLED}</option>
                        </select>
                    </div>
                {/if}
                {if count($TEMPLATES) > 1}
                    <div class="form-group">
                        <label>{$ACTIVE_TEMPLATE}</label>
                        <select class="form-control select2" name="template" style="width: 100%;">
                            {foreach from=$TEMPLATES item=template}
                                <option value="{$template.id}"{if $template.active == true} selected="selected"{/if}>{$template.name}</option>
                            {/foreach}
                        </select>
                    </div>
                {/if}

                
                {if isset($TOPIC_UPDATES)}
                    <div class="form-group">
                        <label>{$TOPIC_UPDATES}</label>
                        <select class="form-control select2" name="topicUpdates" style="width: 100%;">
                            <option value="1" {if ($TOPIC_UPDATES_ENABLED==true)} selected {/if}>{$ENABLED}</option>
                            <option value="0" {if ($TOPIC_UPDATES_ENABLED==false)} selected {/if}>{$DISABLED}</option>
                        </select>
                    </div>
                {/if}
                
                
                {if isset($SIGNATURE)}
                    <div class="form-group">
                        <label for="inputSignature">{$SIGNATURE}</label>
                        {if !isset($MARKDOWN)}
                            <textarea style="width:100%" name="signature" id="inputSignature" rows="15">{$SIGNATURE_VALUE}</textarea>
                        {else}
                            <div class="form-group">
                                <textarea class="form-control" style="width:100%" id="inputSignature" name="signature" rows="20">{$SIGNATURE_VALUE}</textarea>
                                <span class="float-md-right">
                                    <i data-toggle="popover" data-placement="top" data-html="true" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i>
                                </span>
                            </div>
                        {/if}
                    </div>
                {/if}
                <div class="form-group">
                    
                    
                    <input type="hidden" name="action" value="settings">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="btn-primary btn btn-block" value="{$SUBMIT}">
                </div>
           </form>

            <hr class="w-100">

            <h5>{$DISCORD_LINK}</h5>
            <form action="" method="post">
                <div class="d-flex">
                    <div class="form-group" style="flex: 0 0 75%;">
                        <label for="discord_id" class="m-0">{$DISCORD_ID} <span class="badge badge-info" data-toggle="popover" data-title="{$INFO}" data-content="{$ID_INFO|escape}"><i class="fa fa-question"></i></label>
                        <input type="number" name="discord_id" id="discord_id" class="form-control" value="{$DISCORD_ID_VALUE}">
                    </div>
                    <div class="status" style="display: flex;flex: 0 0 25%;align-items: center;justify-content: center;" id="badge-max">
                        {if $DISCORD_LINKED}
                            <span class="badge badge-success">{$LINKED}</span>
                        {else if isset($PENDING_LINK)}
                            <span class="badge badge-warning">{$PENDING_LINK}</span>
                        {else}
                            <span class="badge badge-danger">{$NOT_LINKED}</span>
                        {/if}
                    </div>
                </div>                        
                <input type="hidden" name="action" value="discord">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="submit" value="{$SUBMIT}" class="btn btn-primary">
            </form>
            
            <hr class="w-100">

            {if isset($CUSTOM_AVATARS)}
                <form action="{$CUSTOM_AVATARS_SCRIPT}" method="post" enctype="multipart/form-data">
                    <h5>{$UPLOAD_NEW_PROFILE_IMAGE}</h5>
                    <div class="form-group d-flex">
                        <label class="btn btn-dark mb-0 mr-1" style="flex: 0 0 80%;">
                            {$BROWSE} <input type="file" name="file" hidden/>
                        </label>
                        <input type="submit" value="{$SUBMIT}" class="btn btn-primary" style="flex: 0 0 20%;">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="type" value="avatar">
                    </div>
                </form>
            {/if}
        </div>
        <div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
            <h5><i class="far fa-1x fa-envelope"></i> {$CHANGE_EMAIL_ADDRESS}</h5>
            <form action="" method="post">
                <div class="form-group">
                    <label for="inputPassword">{$CURRENT_PASSWORD}</label>
                    <input type="password" name="password" id="inputPassword" class="form-control">
                </div>
                <div class="form-group">
                    <label for="inputEmail">{$EMAIL_ADDRESS}</label>
                    <input type="email" name="email" id="inputEmail" class="form-control" value="{$CURRENT_EMAIL}">
                </div>
                <div class="form-group">
                    <input type="hidden" name="action" value="email">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" value="{$SUBMIT}" class="btn btn-primary">
                </div>
            </form>
            
            <hr class="w-100">
            
            <h5><i class="fa fa-ellipsis-h"></i> {$CHANGE_PASSWORD}</h5>
            <form action="" method="post">
                <div class="form-group">
                    <label for="inputOldPassword">{$CURRENT_PASSWORD}</label>
                    <input type="password" name="old_password" id="inputOldPassword" class="form-control">
                </div>
                <div class="form-group">
                    <label for="inputNewPassword">{$NEW_PASSWORD}</label>
                    <input type="password" name="new_password" id="inputNewPassword" class="form-control">
                </div>
                <div class="form-group">
                    <label for="inputNewPasswordAgain">{$CONFIRM_NEW_PASSWORD}</label>
                    <input type="password" name="new_password_again" id="inputNewPasswordAgain" class="form-control">
                </div>
                <div class="form-group">
                    <input type="hidden" name="action" value="password">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" value="{$SUBMIT}" class="btn btn-primary">
                </div>
            </form>
            
            <hr class="w-100">
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="troll">
                <label class="form-check-label" for="troll">I'am troll checkbox <span class="badge badge-danger">No clickme</span></label>
              </div>
        </div>
        <div class="tab-pane fade" id="custom-tabs-four-messages" role="tabpanel" aria-labelledby="custom-tabs-four-messages-tab">
            <h5>{$TWO_FACTOR_AUTH}</h5>
            {nocache}
                {if isset($ENABLE)}
                    <a href="{$ENABLE_LINK}" class="btn btn-success btn-block">{$ENABLE}</a>
                {elseif isset($FORCED)}
                    <button class="btn btn-danger btn-block" disabled>{$DISABLE}</button>
                {else}
                    <a href="{$DISABLE_LINK}" class="btn btn-danger btn-block">{$DISABLE}</a>
                {/if}
            {/nocache}
        </div>  
      </div>
    </div>
    <!-- /.card -->
  </div>

<script>
    document.querySelector('#troll').addEventListener('click', ()=> {
        window.location.href = "/logout"
    })
</script>
{include file='footer.tpl'}