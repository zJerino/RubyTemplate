{include file='header.tpl'}

		{foreach from=$NEWS item=item}
			<div class="card card-widget">
              <div class="card-header">
                {$item.title}
                <div class="card-tools badge-news">
					{if ($item.label != "null")}
						{$item.label}
					{/if}
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body">
				<p class="card-text">
					{$item.content|replace:"<img ":"<img class='w-100 h-auto'"}
				</p>
			  </div>
			  <div class="card-footer">
				<div class="user-block">
					<img class="img-circle" src="{$item.author_avatar}" alt="{$item.author_name}">
					<span class="username"><a href="{$item.author_url}">{$item.author_name}.</a></span>
					<span class="description">{$item.time_ago}</span>
				</div>
			  	<a href="{$item.url}" class="btn btn-primary float-right btn-sm"><i class="fa fa-book-reader"></i> {$READ_FULL_POST}</a>
			  </div>
            </div>
		{/foreach}
{include file='footer.tpl'}
	