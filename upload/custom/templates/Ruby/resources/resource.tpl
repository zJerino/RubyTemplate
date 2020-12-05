{assign var="RECURSOSCHIDOS" value="1"}
{include file='header.tpl'}



<div class="row">
	<div class="col-lg-9">
		<div class="card card-solid">
			<div class="card-body d-flex flex-column">
				<h1 class="card-title" style="font-size: 1.4rem;">
					{$TITLE|replace:"{$SITE_NAME}":""|capitalize} <strong><small>{$RELEASE_TITLE}</small></strong>
				</h1>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<div class="forum_post">
							{$DESCRIPTION}
						</div>
						<br />
						<div class="d-flex">
							<span>
								{if $HAS_CONTRIBUTORS eq 1}{$CONTRIBUTORS} {$RESOURCE_CONTRIBUTORS}{/if}
							</span>
							<span class="ml-auto d-inline-flex">
								<div class="star-rating view">
									<span class="far fa-star" data-rating="1" style="color:gold;"></span>
									<span class="far fa-star" data-rating="2" style="color:gold"></span>
									<span class="far fa-star" data-rating="3" style="color:gold;"></span>
									<span class="far fa-star" data-rating="4" style="color:gold;"></span>
									<span class="far fa-star" data-rating="5" style="color:gold;"></span>
									<input type="hidden" name="rating" class="rating-value" value="{$RATING}">
								</div> &nbsp; | {$DOWNLOADS}
							</span>
						</div>
					</div>
					<hr class="w-100">
					<div class="d-flex w-100">
						{if isset($LOG_IN_TO_DOWNLOAD)}
							<button disabled class="btn btn-primary">{$LOG_IN_TO_DOWNLOAD}</button>
						{/if}
						{if isset($DOWNLOAD_URL)}
							<a href="{$DOWNLOAD_URL}" class="btn btn-primary  mx-1" target="_blank">{$DOWNLOAD}</a>
						{elseif isset($PURCHASE_FOR_PRICE)}
							<a {if isset($PURCHASE_LINK)}href="{$PURCHASE_LINK}" {else}disabled {/if}class="btn  mx-1 btn-primary">{$PURCHASE_FOR_PRICE}</a>
						{elseif isset($PAYMENT_PENDING)}
							<button type="button" disabled class="btn btn-primary mx-1">{$PAYMENT_PENDING}</button>
						{/if}
						<a href="{$OTHER_RELEASES_LINK}" class="btn btn-info ml-auto">{$OTHER_RELEASES}</a>
					</div>
				</div>
			</div>
			<!-- /.card-body -->
		</div>
		<div class="card card-solid">
			<div class="card-header border-bottom-0">
				<h5 class="m-0"><i class="far fa-comments-o"></i> {$REVIEWS}</h5>
			</div>
			<div class="card-body">
		
			  {if count($COMMENT_ARRAY)}
				{foreach from=$COMMENT_ARRAY item=comment}
					<div class="post">
						<div class="user-block">
						  	<img class="img-circle img-bordered-sm" src="{$comment.user_avatar}" alt="{$comment.username}">
						  	<span class="username">
								<a href="#">{$comment.username}</a>
					  		</span>
								<span class="description">
								<span data-toggle="tooltip" title="{$comment.date_full}">
									<div class="far fa-clock"></div>
									{$comment.date}
								</span> 
							  	{if isset($DELETE_REVIEW)}
									&nbsp;
									&nbsp;
								 	<i class="far fa-trash-alt"></i>  
									<span class="pull-right"><a href="{$comment.delete_link}" onclick="return confirm('{$CONFIRM_DELETE_REVIEW}');">{$DELETE_REVIEW}</a></span><br />
					  			{/if}
							</span>
						</div>
						{$comment.content|replace:"<p":"<p class='mb-0'"}
						
						<p class="mb-0 border-top pt-2">
							<div class="star-rating view" style="display:inline;">
								<span class="far fa-star" data-rating="1" style="color:gold;"></span>
								<span class="far fa-star" data-rating="2" style="color:gold"></span>
								<span class="far fa-star" data-rating="3" style="color:gold;"></span>
								<span class="far fa-star" data-rating="4" style="color:gold;"></span>
								<span class="far fa-star" data-rating="5" style="color:gold;"></span>
								<input type="hidden" name="rating" class="rating-value" value="{$comment.rating}">
							</div> | {$comment.release_tag}
						</p>
					  </div>
				{/foreach}
			  {else}
				<p class="m-0">{$NO_REVIEWS}</p>
			  {/if}
		
			  {if $CAN_REVIEW == true && !isset($PAYMENT_PENDING) && !isset($PURCHASE_FOR_PRICE)}
			  <h4>{$NEW_REVIEW}</h4>
			  <form action="" method="post">
				<div class="form-group">
				  <div class="star-rating set">
					<span class="far fa-star" data-rating="1" style="color:gold;"></span>
					<span class="far fa-star" data-rating="2" style="color:gold"></span>
					<span class="far fa-star" data-rating="3" style="color:gold;"></span>
					<span class="far fa-star" data-rating="4" style="color:gold;"></span>
					<span class="far fa-star" data-rating="5" style="color:gold;"></span>
					<input type="hidden" name="rating" class="rating-value" value="0">
				  </div>
				</div>
				<div class="form-group">
				  {if !isset($MARKDOWN)}
				  <textarea style="width:100%" name="content" id="editor" rows="15"></textarea>
				  {else}
				  <textarea class="form-control" style="width:100%" id="markdown" name="content" rows="20"></textarea>
				  <span class="pull-right"><i data-toggle="popover" data-placement="top" data-html="true" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i></span>
				  {/if}
				</div>
				<div class="form-group">
				  <input type="hidden" name="token" value="{$TOKEN}">
				  <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
				</div>
			  </form>
			  {/if}
			</div>
		</div>
		
	</div>
	<div class="col-3">
		<div class="card">
		    <div class="card-header">
			  {$RESOURCE}
			</div>

		    <div class="card-body text-center">
				<span style="font-size: 1.3rem;">
					{$TITLE|replace:"{$SITE_NAME}":""|capitalize} <strong><small>v{$RELEASE_TITLE}</small></strong>
				</span>
				
				<div class="star-rating view">
				  <span class="far fa-star" data-rating="1" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="2" style="color:gold"></span>
				  <span class="far fa-star" data-rating="3" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="4" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="5" style="color:gold;"></span>
				  <input type="hidden" name="rating" class="rating-value" value="{$RATING}">
				</div>
			    {$VIEWS}<br />
				<br>
				{if isset($MODERATION) && count($MODERATION)}
					<div class="btn-group mb-1 dropdown w-100">
						<button type="button" class="btn btn-warning btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$MODERATION_TEXT}</button>
						<div class="dropdown-menu">
							{foreach from=$MODERATION item=item}
								<a class="dropdown-item" href="{$item.link}">{$item.title}</a>
							{/foreach}
						</div>
					</div>
				{/if}
				{if isset($CAN_UPDATE)}
					<a href="{$UPDATE_LINK}" class="btn btn-info btn-block">{$UPDATE}</a>
				{/if}
				{if isset($CAN_EDIT)}
					<a href="{$EDIT_LINK}" class="btn btn-danger btn-block mb-1">{$EDIT}</a>
				{/if}
			</div>
		  </div>
		  <div class="card">
		    <div class="card-header">
			  {$AUTHOR}
			</div>

		    <div class="card-body text-center">
			    <a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="img-circle" alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
				<a href="{$AUTHOR_RESOURCES}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
				<br>
			  	<a href="{$AUTHOR_RESOURCES}">{$VIEW_OTHER_RESOURCES}</a>
			</div>
		  </div>
	</div>
</div>

{include file='footer.tpl'}
