{include file='header.tpl'}
<div class="container-fluid">
	<ol class="breadcrumb">
		{foreach from=$BREADCRUMBS item=breadcrumb}
			<li class="breadcrumb-item{if isset($breadcrumb.active)} active{/if}">{if !isset($breadcrumb.active)}<a href="{$breadcrumb.link}">{/if}{$breadcrumb.forum_title}{if !isset($breadcrumb.active)}</a>{/if}</li>
		{/foreach}
	</ol>
	{if (count($SUBFORUMS))}
		<div class="card">
			<div class="card-header">
			<h3 class="card-title">{$SUBFORUM_LANGUAGE|capitalize}</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0"  style="overflow-wrap: anywhere;">
			<table class="table table-striped">
				<thead>
				<tr>
					<th style="width: 55%">{$FORUMS|capitalize}</th>
					<th style="width: 25%; text-align: center;">{$TOPICS|capitalize}</th>
					<th style="width: 20%" class="d-none d-sm-table-cell">{$LATEST_POSTS}</th>
				</tr>
				</thead>
				<tbody>
					{foreach from=$SUBFORUMS item=item}
						<tr>
							<td>
								{if (!empty($item.icon))}
									{$item.icon}
									&nbsp;
								{else}
									<i class="far fa-comments"></i>
									&nbsp;
								{/if}
								{$item.label}
								&nbsp;
								<a href="{$item.link}">
									{$item.title} 
								</a>
							</td>
							<td class="text-center">{$item.topics}</td>
							<td class="d-none d-sm-table-cell">
								{if (count($item.latest_post))}
									<a href="{$item.latest_post.link}">{$item.latest_post.title|capitalize}</a>
									<span>
										{$BY|capitalize} <a style="{$item.latest_post.last_user_style}" href="{$item.latest_post.last_user_link}" data-poload="{$USER_INFO_URL}{$item.latest_post.last_user_id}" data-html="true" data-placement="top">{$item.latest_post.last_user} </a>
									</span>
								{/if}
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
			</div>
			<!-- /.card-body -->
		</div>  
	{/if}
	<div class="card">
		<div class="card-header">
		  	<h3 class="card-title">{$TOPICS|capitalize}</h3>
			{if $NEW_TOPIC_BUTTON}
				<span class="float-md-right">
					<a href="{$NEW_TOPIC_BUTTON}" class="btn btn-primary btn-sm">
						{$NEW_TOPIC}
					</a>
				</span>
			{/if}
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0" style="overflow-wrap: anywhere;">
		  <table class="table table-striped">
			<thead>
			  <tr>
				<th style="width: 40%;">{$TOPIC|capitalize}</th>
				<th style="width: 15%" class="text-center d-none d-sm-table-cell">{$VIEWS|capitalize}</th>
				<th style="width: 20%" class="text-center ">{$POSTS|capitalize}</th>
				<th style="width: 25%;" class="d-none d-sm-table-cell">{$LAST_REPLY}</th>
			  </tr>
			</thead>
			<tbody>
			{if (count($LATEST_DISCUSSIONS) || count($STICKY_DISCUSSIONS))}
				{foreach from=$STICKY_DISCUSSIONS item=item}
					<tr>
						<td>
							{if ($item.locked == "1")}
								<i class="fa fa-lock"></i>
								&nbsp;
							{/if}
							{$item.label}
							&nbsp;
							<a href="{$item.link}">
								{$item.topic_title} 
							</a>
						</td>
						<td class="text-center d-none d-sm-table-cell">{$item.views}</td>
						<td class="text-center">{$item.posts}</td>
						<td class="d-none d-sm-table-cell">
							<span data-toggle="tooltip" data-trigger="hover" data-original-title="{$item.last_reply}">{$item.last_reply_rough}</span>&nbsp; {$BY}&nbsp;<a style="{$item.last_reply_style}" href="{$item.last_reply_link}" data-poload="{$USER_INFO_URL}{$item.last_reply_user_id}" data-html="true" data-placement="top">{$item.topic_created_username} </a>
						</td>
					</tr>
				{/foreach}
				{foreach from=$LATEST_DISCUSSIONS item=item}
					<tr >
						<td><a href="{$item.link}">{$item.topic_title} </a></td>
						<td class="text-center d-sm-table-cell d-none">{$item.views}</td>
						<td class="text-center">{$item.posts}</td>
						<td class="d-none d-sm-table-cell">
							<span data-toggle="tooltip" data-trigger="hover" data-original-title="{$item.last_reply}">{$item.last_reply_rough}</span> {$BY} <a style="{$item.last_reply_style}" href="{$item.last_reply_link}" data-poload="{$USER_INFO_URL}{$item.last_reply_user_id}" data-html="true" data-placement="top">{$item.topic_created_username} </a>
						</td>
					</tr>
				{/foreach}
			{else}
				<tr>
					<td>
						{$NO_TOPICS}
					</td>
				</tr>
			{/if}
			</tbody>
		  </table>
		</div>
		<!-- /.card-body -->
	  </div>  
</div>

{include file='footer.tpl'}
