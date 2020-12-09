
<h4 class="mb-4">{$PF_LATEST_POSTS_TITLE}</h4>
{if isset($NO_POSTS)}
  <p class="text-danger">{$NO_POSTS}</p>
{else}
	<div class="timeline timeline-inverse nobefore">
		{foreach from=$PF_LATEST_POSTS item=post}
		<div>
			
			<div class="timeline-item mx-2">
				<span class="time"><i class="far fa-clock"></i> <span data-toggle="tooltip" title="{$post.date_full}">{$post.date_friendly}</span></span>

				<h3 class="timeline-header"><a href="{$post.link}">{$post.title}</a></h3>

				<div class="timeline-body">
					{$post.content|replace:"<img ":"<img class='w-100 h-auto'"}
				</div>
				<div class="timeline-footer">
					{$USERNAME} &bull; {$post.date_full}
				</div>
			</div>
		</div>
		{/foreach}
	</div>
{/if}