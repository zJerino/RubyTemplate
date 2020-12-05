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
		<ul class="list-unstyled mb-3">
			{foreach from=$USER_DETAILS_VALUES key=name item=value}
				<li>
					<strong>{$name}:</strong> {$value}
				</li>
			{/foreach}
		</ul>

		{if isset($FORUM_GRAPH)}
			<div id="chartWrapper">
				<h4>{$FORUM_GRAPH}</h4>
				<canvas id="dataChart" width="100%" height="40"></canvas>
				<info class="d-flex text-center">
					{$LOADING}
				</info>
			</div>
		  {/if}
	</div>
</div>

{include file='footer.tpl'}