{include file='header.tpl'}
{foreach from=$FORUMS item=item}
	<div class="card card-primary">
		<div class="card-header">
			<div class="card-title">
				{$item.icon} &nbsp; {$item.title}
			</div>
			<div class="card-tools">
				<button type="button" class="btn btn-tool" style="transform: translateY(0.8rem);" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
			</div>
		<!-- /.card-tools -->
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0">
			<table class="table table-striped">
				<tbody>
					{if (isset($item.subforums) && count($item.subforums))}
						{foreach from=$item.subforums item=sitem}
							<tr>
								<td style="width: 4rem;" class="subforum-icon">
									{if (!empty($sitem->icon))}
										{$sitem->icon}
									{else}
										<i class="far fa-comments fa-2x"></i>
									{/if}
								</td>
								<td>
									<a href="{$sitem->link}" data-toggle="tooltip" title="{$sitem->forum_description}">
										{$sitem->forum_title}
									</a>
									<br>
									<small>
										{$TOPICS|capitalize}: {$sitem->topics} &bull; {$POSTS|capitalize}: {$sitem->posts}
									</small>
								</td>
						</tr>
						{/foreach}
					{else}
						<tr>
							<td>O_O Empty</td>
						</tr>
					{/if}
				</tbody>
			</table>
		</div>
	</div>
{/foreach}
{include file='footer.tpl'}