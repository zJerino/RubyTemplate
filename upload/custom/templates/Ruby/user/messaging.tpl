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
<div class="card card-primary card-outline">
	<div class="card-header">
		<div class="card-title">
			<i class="fa fa-envelope"></i> {$MESSAGING}
		</div>
		<span class="card-tools">
			{if isset($NEW_MESSAGE)}<span class="float-md-right"><a href="{$NEW_MESSAGE_LINK}" class="btn btn-primary align-items-center"><small><i class="fa fa-plus"></i> {$NEW_MESSAGE}</small></a></span>{/if}
		</span>
	</div>
	<div class="card-body">
		{if count($MESSAGES)}
			<table class="table table-striped">
				<thead>
					<tr>
					<th>{$MESSAGE_TITLE}</th>
					<th>{$LAST_MESSAGE}</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$MESSAGES item=message}
						<tr>
							<td><a href="{$message.link}">{$message.title}</a></td>
							<td><a data-toggle="tooltip" title="{$message.last_message_date_full}">{$message.last_message_date}</a></td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		{else}
			<div class="alert alert-danger">
				{$NO_MESSAGES}
			</div>
		{/if}
	</div>
</div>
{include file='footer.tpl'}