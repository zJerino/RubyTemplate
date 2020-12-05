

{assign var="USER_PANEL" value="true"}
{include file='header.tpl'}

<div class="card{if count($SUBMISSIONS_LIST)} card-primary {else} card-danger {/if}card-outline">
	<div class="card-header">
		<h2 class="card-title">{$SUBMISSIONS}</h2>
	</div>
	<div class="card-body">
		{if count($SUBMISSIONS_LIST)}
			<div class="table-responsive">
		  		<table class="table">
					<thead>
			  			<tr>
							<th>{$FORM}</th>
							<th>{$UPDATED_BY}</th>
							<th>{$STATUS}</th>
							<th></th>
			  			</tr>
					</thead>
					<tbody>
			  			{foreach from=$SUBMISSIONS_LIST item=submission}
							<tr>
				  				<td>{$submission.form_name}</td>
				  				<td>
				  					<a href="{$submission.updated_by_profile}" style="{$submission.updated_by_style}"><img src="{$submission.updated_by_avatar}" style="max-height:25px;max-width:25px;" alt="{$submission.updated_by_name}" class="rounded"> {$submission.updated_by_name}</a>
				  					<br /><span data-toggle="tooltip" data-original-title="{$submission.reported_at_full}">{$submission.updated_at}</span>
				  				</td>
				  				<td><h5>{$submission.status}</h5></td>
				  				<td><a href="{$submission.link}" class="btn btn-primary float-right">{$VIEW} &raquo;</a></td>
							</tr>
			  			{/foreach}
					</tbody>
		  		</table>
			</div>
	  	{else}
			{$NO_SUBMISSIONS}
	  	{/if}
	</div>
</div>

{include file='footer.tpl'}