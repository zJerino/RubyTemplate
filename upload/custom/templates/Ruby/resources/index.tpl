{assign var=RESOURCES_PANEL value="1"}
{include file='header.tpl'}

<div class="card card-outline card-primary">
		<div class="card-header">
			<h3 class="card-title">{$RESOURCES}</h3>
			<div class="card-tools">
				{if isset($NEW_RESOURCE)}
					<a href="{$NEW_RESOURCE_LINK}" class="btn btn-primary btn-tool active">{$NEW_RESOURCE}</a>
				{/if}
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body table-responsive p-0">
			{if $LATEST_RESOURCES}
				<table class="table table-hover text-nowrap">
					<thead>
					<tr>
						<th>{$RESOURCE}</th>
						<th>{$STATS}</th>
						<th class="d-none d-sm-table-cell">{$AUTHOR}</th>
					</tr>
					</thead>
					<tbody>
						{foreach from=$LATEST_RESOURCES item=resource}
							<tr>
								<td title="{$resource.views} &bull; {$resource.downloads}" data-toggle="tooltip">
									<a href="{$resource.link}">{$resource.name}</a> <span class="pull-right">{$resource.version}</span>
									<br>
									{$resource.description}
								</td>
								<td>
									<div class="star-rating view">
										<span class="far fa-star" data-rating="1" style="color:gold;"></span>
										<span class="far fa-star" data-rating="2" style="color:gold"></span>
										<span class="far fa-star" data-rating="3" style="color:gold;"></span>
										<span class="far fa-star" data-rating="4" style="color:gold;"></span>
										<span class="far fa-star" data-rating="5" style="color:gold;"></span>
										<input type="hidden" name="rating" class="rating-value" value="{$resource.rating}">
									</div>
									{$resource.downloads}
								</td>
								<td class="d-none d-sm-table-cell">
									<a href="{$resource.author_profile}" style="{$resource.author_style}">{$resource.author}</a>
									<br>
									<span title="{$resource.updated_full}" data-toggle="tooltip">
										{$resource.updated}
									</span>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			{else}
				<div class="text-center alert alert-danger">
					{$NO_RESOURCES}
				</div>
			{/if}
		</div>
		<!-- /.card-body -->
	</div>

{include file='footer.tpl'}
