{assign var="USER_PANEL" value="true"}
{include file='header.tpl'}


{if isset($ERROR)}
<div class="alert alert-danger">
  {$ERROR}
</div>
{/if}

{if isset($MESSAGE_SENT)}
<div class="alert alert-success">
  {$MESSAGE_SENT}
</div>
{/if}

<div class="card card-sucress cardutline direct-chat direct-chat-success">
	<div class="card-header">
	  <h3 class="card-title">{$MESSAGE_TITLE}</h3>

	  <div class="card-tools">
		  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
		</button>
		<a data-card-widget="remove">
			<a href="{$LEAVE_CONVERSATION_LINK}" onclick="return confirm('{$CONFIRM_LEAVE}');">{$LEAVE_CONVERSATION}</a>
			<i class="fas fa-sign-out-alt"> </i>
		</a>
	  </div>
	</div>
	<!-- /.card-header -->
	<div class="card-body">
		
	  <div class="direct-chat-messages">
		{foreach from=$MESSAGES item=message}
			{if ($message.author_username == $LOGGED_IN_USER.username)}
				<div class="direct-chat-msg right">
					<div class="direct-chat-infos clearfix">
				  		<span class="direct-chat-name float-right">
							<a href="{$message.author_profile}" style="{$message.author_style}">
								{$message.author_username}
							</a>
						  </span>
				  		<span class="direct-chat-timestamp float-left" data-toggle="tooltip" title="{$message.message_date_full}">{$message.message_date}</span>
					</div>
					<img class="direct-chat-img" src="{$message.author_avatar}" alt="{$message.author_username}">
					<div class="direct-chat-text">
				  		{$message.content}
					</div>
				</div>
			{else}
				<div class="direct-chat-msg">
					<div class="direct-chat-infos clearfix">
						<span class="direct-chat-name float-left">
							<a href="{$message.author_profile}" style="{$message.author_style}">
								{$message.author_username}
							</a>
						</span>
				  		<span class="direct-chat-timestamp float-right" data-toggle="tooltip" title="{$message.message_date_full}">{$message.message_date}</span>
					</div>
					<img class="direct-chat-img" src="{$message.author_avatar}" alt="{$message.author_username}">
					<div class="direct-chat-text">
				  		{$message.content}
					</div>
			  	</div>
			{/if}
		{/foreach}
	  </div>
	</div>
	<!-- /.card-body -->
	<div class="card-footer">
		<form action="" method="post">
			<input type="hidden" name="token" value="{$TOKEN}">
			<div class="input-group">
		  		<input type="text" name="content" placeholder="{$NEW_REPLY}" class="form-control">
		  		<span class="input-group-append">
					<button type="submit" class="btn btn-success">{$SUBMIT}</button>
		  		</span>
			</div>
		  </form>
	</div>
	<!-- /.card-footer-->
  </div>


<script>
	document.addEventListener('turbolinks:load', () => {
        $('.direct-chat-messages').animate({
            scrollTop: 99999999999
		}, 1500);	
    })
</script>

{include file='footer.tpl'}