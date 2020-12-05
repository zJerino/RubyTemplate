<div class="card card-{$RUBY.WIDGETS.COLOR} card-{$RUBY.WIDGETS.LAYOUT}">
    <div class="card-header">
      <h5 class="card-title m-0">{$LATEST_POSTS}</h5>
    </div>
    <div class="card-body">
        <ul class="nav nav-pills flex-column">
            {foreach from=$LATEST_POSTS_ARRAY item=post name=latest_posts}
                <li class="nav-item mb-1 hover-1 px-2 py-1 d-flex">
                    <avatar id="user">
                        <img src="{$post.last_reply_avatar}" alt="{$post.last_reply_username}" srcset="{$post.last_reply_avatar}" class="mr-2 img-circle" style="width: 3rem;height: 2.8rem;">
                    </avatar>
                    <span class="d-flex flex-column">
                        <a href="{$post.link}">{$post.label} {$post.topic_title}</a>
                        <span>{$BY|capitalize} <a href="{$post.author_link}" style="{$post.last_reply_style}">{$post.last_reply_username}</a> - <span data-toggle="tooltip" title="{$post.last_reply}">{$post.last_reply_rough}</span></span> 
                    </span>
                </li>
            {/foreach}
        </ul>
    </div>
</div>