{assign var="USER_PANEL" value="true"}
{include file='header.tpl'}

<style>
	.content_second>* {
		margin: 0;
		padding: 0;
		color: initial;
	}
</style>


	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}
	{if isset($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				{$error}<br />
			{/foreach}
		</div>
	{/if}

<div class="card card-primary card-outline">
	<div class="card-header">
		<h2 class="card-title">{$SUBMISSIONS}</h2>
	</div>
	<div class="card-body">
		<div class="d-flex text-center">
			<div class="w-100">{$FORM_X}</div>
			<div class="w-100">{$CURRENT_STATUS_X}</div>
			<div class="w-100">{$LAST_UPDATED} <span class="pull-right" data-toggle="tooltip" data-original-title="{$LAST_UPDATED_DATE}">{$LAST_UPDATED_FRIENDLY}</span></div>
		</div>
		<hr class="w-100">
		<div class="d-block">
			<a href="{$USER_PROFILE}" style="{$USER_STYLE}" target="_blank"><img src="{$USER_AVATAR}" class="rounded" style="max-width:25px;max-height:25px;" alt="{$USER}" /> {$USER}</a>:
        	<span class="pull-right float-right" data-toggle="tooltip" data-original-title="{$CREATED_DATE}">{$CREATED_DATE_FRIENDLY}</span>
		</div>
		<br>
		<ul class="nav flex-column">
			{foreach from=$ANSWERS item=answer}
				<li class="nav-item">			
					{$answer.question} <span class="float-right">{$answer.answer}</span>
				</li>
			{/foreach}
		</ul>
	</div>
</div>
{if count($COMMENTS)}		
	{foreach from=$COMMENTS item=reply name=arr}
		<div class="card card-primary">
			<div class="card-body" id="post-{$reply.id}">
				<div class="d-flex flex-column flex-sm-row">
					<div id="seccion_user" style="padding-right: 0.5rem;border-right: 1px dashed #5554;width: 100%;flex: 0 0 35%;" class="align-items-center d-flex flex-column">
						<img loading="lazy" src="{$reply.avatar}" alt="{$reply.username}" class="mb-1" srcset="{$reply.avatar}" style="width: 8em;height: 8em;border: 1px solid {if ($reply.online_now == true)} green {else} #605f5f4f {/if};border-radius: 50%;">
						<a style="{$reply.style}" class="mb-1" href="{$reply.profile}">{$reply.username}</a>
						<hr class="w-100 d-block d-sm-none">
					</div>
					<div id="seccion_content" class="d-flex flex-column" style="width: 100%;padding-left: 0.5rem;flex: 0 0 65%;">
						<div class="content_firts">
							{$reply.content}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}
{else}
	<div class="card card-primary card-outline">
		<div class="card-body">
			<div class="alert alert-danger">
				{$NO_COMMENTS}	
			</div>
		</div>
	</div>
	</br>
{/if}



<div class="card{if !isset($ERRORS)} card-primary {else} card-danger {/if}card-outline">
	<div class="card-header">
		<h2 class="card-title">{$NEW_COMMENT}</h2>
	</div>
	<div class="card-body">
		{if $CAN_COMMENT}
			<form action="" method="post">
		  		<div class="form-group">
					<textarea class="form-control" name="content" rows="5" placeholder="{$NEW_COMMENT}"></textarea>
		  		</div>
		  		<div class="form-group">
					<input type="hidden" name="token" value="{$TOKEN}">
					<input type="submit" value="{$SUBMIT}" class="btn btn-primary">
				</div>
			</form>
		{/if}
	</div>
</div>

{include file='footer.tpl'}