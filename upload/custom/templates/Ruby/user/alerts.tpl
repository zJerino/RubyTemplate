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
			<i class="fa fa-bell"></i> {$ALERTS}
		</div>
		<span class="card-tools">
			<a href="{$DELETE_ALL_LINK}" class="btn btn-danger"><small><i class="fa fa-trash"></i> {$DELETE_ALL}</small></a>
		</span>
	</div>
	<div class="card-body">
		<table class="table table-striped">
			<tbody>
				{if count($ALERTS_LIST)}
			    	{foreach from=$ALERTS_LIST item=alert}
						<tr>
							<td>
								<span class="d-flex align-items-center">
									{if $alert->read eq 0}
										<i class="fa fa-envelope"></i>
									{else}
										<i class="fa fa-envelope-open"></i>
									{/if}
									<span class="ml-2" data-toggle="tooltip" title="">
										{$alert->content}
									</span>
									<div class="ml-auto">
										<span class="mr-3" data-toggle="tooltip" data-trigger="hover" data-original-title="{$alert->date_nice} &bull; {$alert->date}"><i class="fa fa-clock"></i></span>
										<a href="{$alert->view_link}" class="badge badge-danger badge-a">{$CLICK_TO_VIEW}</a>
									</div>
								</span>
							</td>
						</tr>
					{/foreach}
				{else}
					<tr>
						<td class="text-center text-danger">
							{$NO_ALERTS}
						</td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>
</div>

{include file='footer.tpl'}