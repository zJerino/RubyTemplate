{include file='header.tpl'}
<div class="container">
	<ol class="breadcrumb">
		{foreach from=$BREADCRUMBS item=breadcrumb}
			<li class="breadcrumb-item{if isset($breadcrumb.active)} active{/if}">{if !isset($breadcrumb.active)}<a href="{$breadcrumb.link}">{/if}{$breadcrumb.forum_title}{if !isset($breadcrumb.active)}</a>{/if}</li>
		{/foreach}
	</ol>

	{if (count($SUBFORUMS))}
		<div class="card">
			<div class="card-header">
			<h3 class="card-title">{$SUBFORUM_LANGUAGE}</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0">
			<table class="table table-striped">
				<tbody>
					{if !empty($SUBFORUMS)}
						{foreach from=$SUBFORUMS item=item}
							<tr>
								<td style="width: 4rem;" class="subforum-icon">
									{if (!empty($item.icon))}
										{$item.icon}
									{else}
										<i class="far fa-comments fa-2x"></i>
									{/if}
								</td>
								<td>
									<a href="{$item.link}" data-toggle="tooltip" title="{$item.forum_description}" style="color: initial;">
										{$item.title}
									</a>
									<br>
									<small>
										{$TOPICS|capitalize}: {$item.topics}
									</small>
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
	{/if}

	  <div class="card">
		  <div class="card-header">
		  	<h3 class="card-title">
				{$TOPICS|capitalize}
			</h3>
			{if $NEW_TOPIC_BUTTON}
				<span class="float-md-right">
					<a href="{$NEW_TOPIC_BUTTON}" class="btn btn-primary btn-sm">
						{$NEW_TOPIC}
					</a>
				</span>
			{/if}
		  </div>
		  <div class="card-body">
		  	{$NO_TOPICS_FULL}
		  </div>
	  </div>
</div>


{include file='footer.tpl'}
