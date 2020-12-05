{if $CAN_VIEW == true}
{include file='header.tpl'}

<section class="content">
	<div class="container-fluid">
	  <div class="row">
		<div class="col-md-3">

		  <!-- Profile Image -->
		  <div class="card card-primary card-outline">
			<div class="card-body box-profile">
			  <div class="text-center">
				<img class="profile-user-img img-fluid img-circle" src="{$AVATAR}" alt="{$USERNAME}">
			  </div>

			  <h3 class="profile-username text-center">{$USERNAME}</h3>

			  <p class="text-muted text-center m-0 badge-max">{$GROUP}</p>

			  <ul class="list-group list-group-unbordered">
				<hr class="no-last w-100">
				{if !empty($FRIENDS.list)}
					<li class="list-group-item border-0">
						<b>{$FRIENDS.title}</b> <a class="float-right {if (count($FRIENDS.list) > 0)}text-warning{elseif (count($FRIENDS.list) > 10)} text-success{/if}">{$FRIENDS.list|count}</a>
				  	</li>
				{else}
					<li class="list-group-item border-0">
						<b>{$FRIENDS.title}</b> <a class="float-right text-danger">{$FRIENDS.no_friends}</a>
				  	</li>
				{/if}
			  </ul>
			  {if isset($FRIENDS.button)}
					{if ($FRIENDS.button.action == 'add_friend')}
						{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-primary'}
						{assign var='FRIENDS_BUTTON_ICON' value='<i class="fa fa-user-plus"></i>'}
					{else if ($FRIENDS.button.action == 'btn btn-danger')}
						{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-warning'}
						{assign var='FRIENDS_BUTTON_ICON' value='<i class="fa fa-user-times"></i>'}
					{else if ($FRIENDS.button.action == 'accept_request')}
						{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-warning'}
						{assign var='FRIENDS_BUTTON_ICON' value='<i class="fa fa-user-check"></i>'}
					{else if ($FRIENDS.button.action == 'cancel_request')}
						{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-danger'}
					  	{assign var='FRIENDS_BUTTON_ICON' value='<i class="fa fa-user-times"></i>'}
					{else if ($FRIENDS.button.action == 'remove_friend')}
						{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-danger'}
					  	{assign var='FRIENDS_BUTTON_ICON' value='<i class="fa fa-user-minus"></i>'}
			  		{/if}
		  		{/if}
			  {if (isset($FRIENDS))}
				{if isset($FRIENDS.button)}
					<form action="" method="post" id="form-friend">
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="action" value="{$FRIENDS.button.action}">
						<button type="submit" class="{$FRIENDS_BUTTON_CLASS} btn-block">{$FRIENDS_BUTTON_ICON} {$FRIENDS.button.text}</button>
					</form>
				{/if}
			  {/if}
			  <hr class="no-last">	
			{if isset($LOGGED_IN)}
				{if !isset($SELF)}
					{if $MOD_OR_ADMIN ne true}
						<a data-toggle="modal" data-target="#blockModal" class="btn text-light btn-{if isset($BLOCK_USER)}danger{else}warning{/if} btn-block"><i class="fas fa-ban fa-fw"></i> {if isset($BLOCK_USER)}{$BLOCK_USER}{else}{$UNBLOCK_USER}{/if}</a>
					{/if}
					<a href="{$MESSAGE_LINK}" class="btn btn-secondary btn-block">
						<i class="fas fa-envelope fa-fw"></i> {$MESSAGING}
					</a>
					{if isset($RESET_PROFILE_BANNER) && $CAN_MODERATE == true}
						<!-- {* No use in Ruby Template *} -->
			  			<a href="{$RESET_PROFILE_BANNER_LINK}" class="btn btn-danger btn-block" rel="tooltip" data-title="{$RESET_PROFILE_BANNER}">
			    			<i class="fas fa-image fa-fw"></i> {$RESET_PROFILE_BANNER}
			  			</a>
					{/if}
				{else}
					<a href="{$MESSAGE_LINK}" class="btn btn-secondary btn-block">
						<i class="fas fa-envelope fa-fw"></i> {$MESSAGING}
					</a>
					<a class="btn btn-block btn-info text-light" data-toggle="modal" data-target="#imageModal">
						<i class="fas fa-image fa-fw"></i> {$UPLOAD_PROFILE_BANNER}
					</a>
		    	{/if}
		  	{/if}
			</div>
			<!-- /.card-body -->
		  </div>
		  <div class="card card-primary">
			  <div class="card-body">
				  <div class="jumbotron mb-0" style="background-image:url('{$BANNER}');"></div>
			  </div>
		  </div>
		  <!-- /.card -->

		  <!-- About Me Box -->
		  <div class="card card-primary">
			<div class="card-header">
			  <h3 class="card-title">{$ABOUT}</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<div class="d-flex flex-column align-items-center">
					<img {if isset($ABOUT_FIELDS.minecraft)}src="{$ABOUT_FIELDS.minecraft.image}{else}class="rounded" style="max-height:75px;max-width:75px;" src="{$AVATAR}{/if}" alt="{$USERNAME}" onerror="console.log('Removed!', this); this.remove()" />
					<h5 {if $USERNAME_COLOUR != false} style="{$USERNAME_COLOUR}"{/if}>{$NICKNAME}</h5>
				</div>
				<hr class="w-100">
				
				{foreach from=$ABOUT_FIELDS item=item key=key}
					{if ($key === "minecraft")}
					{else}
						<strong><i class="fas fa-book mr-1"></i> {$item.title}</strong>
						<p class="text-muted" data-toggle="tooltip" title="{$item.tooltip}">
							{$item.value}
						</p>
						<hr class="no-last w-100">
					{/if}
				{/foreach}
				
			</div>
			<!-- /.card-body -->
		  </div>
		  <!-- /.card -->
		</div>
		<!-- /.col -->
		<div class="col-md-9">
		  <div class="card">
			<div class="card-header p-2">
			  <ul class="nav nav-pills justify-content-center">
				<li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">{$FEED}</a></li>
				{foreach from=$TABS item=item key=key}
					{if ($key !="friends")}
						<li class="nav-item"><a class="nav-link" href="#{$key}" data-toggle="tab">{$item.title}</a></li>
					{/if}
				{/foreach}
			  </ul>
			</div><!-- /.card-header -->
			<div class="card-body">
			  <div class="tab-content">
				<div class="active tab-pane" id="activity">
					{if isset($LOGGED_IN)}
						{if isset($ERROR)}
							<div class="alert alert-danger">
			  					{$ERROR}
							</div>
						{/if}
            			{if isset($SUCCESS)}
							<div class="alert alert-success">
			  					{$SUCCESS}
							</div>
						{/if}
		  				<form action="" method="post">
							<div class="form-group">
				  				<textarea name="post" class="form-control" placeholder="{$POST_ON_WALL}"></textarea>
							</div>
							<input type="hidden" name="action" value="new_post">
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
		  				</form>	
					{/if}
					<hr class="no-last">
					{if count($WALL_POSTS)}
						  {foreach from=$WALL_POSTS item=post}
						  <div class="modal fade" id="modal-edit-{$post.id}" tabindex="-1" role="dialog" aria-labelledby="edit-labe" aria-hidden="true">
							  <div class="modal-dialog" role="document">
								<div class="modal-content">
								  <div class="modal-header">
									<h5 class="modal-title" id="edit-label">{$EDIT_POST}</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									  <span aria-hidden="true">&times;</span>
									</button>
								  </div>
								  <form action="" method="post" style="display:inline;" id="form-edit-{$post.id}">
									<div class="modal-body">
									  <textarea name="content" class="form-control">{$post.content}</textarea>
									  
									  <input type="hidden" name="token" value="{$TOKEN}">
									  <input type="hidden" name="post_id" value="{$post.id}">
									  <input type="hidden" name="action" value="edit">
									</div>
									<div class="modal-footer">
									  <a class="btn btn-danger text-light" data-dismiss="modal">{$CANCEL}</a>
									  <input class="btn btn-primary" type="submit" value="{$SUBMIT}">
									</div>
								  </form>
								</div>
							  </div>
							</div>
							<div class="modal fade" id="modal-delete-{$post.id}" tabindex="-1" role="dialog" aria-labelledby="delete-label" aria-hidden="true">
								<div class="modal-dialog" role="document">
								  <div class="modal-content">
									<form action="" method="post" style="display:inline;" id="form-delete-{$post.id}">
									  <div class="modal-body">
										<div class="alert alert-danger">
											{$CONFIRM_DELETE}
										</div>
										<input type="hidden" name="token" value="{$TOKEN}">
										<input type="hidden" name="post_id" value="{$post.id}">
										<input type="hidden" name="action" value="delete">
									  </div>
									  <div class="modal-footer">
										<a class="btn btn-danger text-light" data-dismiss="modal">{$CANCEL}</a>
										<input class="btn btn-primary" type="submit" value="{$SUBMIT}">
									  </div>
									</form>
								  </div>
								</div>
							  </div>
								<div class="modal fade" id="modal-reply-{$post.id}" tabindex="-1" role="dialog" aria-labelledby="delete-label" aria-hidden="true">
									<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-body">
											<h5>{$REPLY}</h5>

											{if isset($post.replies.replies)}
												{foreach from=$post.replies.replies item=item name="replays"}
													<ul class="products-list product-list-in-card pl-2 pr-2">
														<li class="item">
															<div class="product-img">
																<img src="{$item.avatar}" alt="{$item.username}" class="img-size-50 img-circle">
															</div>
															<div class="product-info d-flex flex-column">
																<span class="d-flex">
																	<a href="{$item.profile}" class="product-title" style="{$item.style}">{$item.username}</a>
																	
																	<div class="ml-auto font-normal text-muted font-small">
																		<i class="far fa-clock"></i> 
																		<span class="date" data-toggle="tooltip" data-content="{$item.time_full}">{$item.time_friendly}</span> 
																		<div class="dropdown d-inline-block">
																			<a data-toggle="dropdown" class="btn btn-light"><i class="fa fa-ellipsis-v"></i></a>
																			<div class="dropdown-menu">
																				{if (isset($CAN_MODERATE) && $CAN_MODERATE eq 1) || $post.self eq 1}
																					<form hidden action="" method="post" id="form-delete-{$item.id}">
																						<input type="hidden" name="action" value="deleteReply">
																						<input type="hidden" name="token" value="{$TOKEN}">
																						<input type="hidden" name="post_id" value="{$item.id}">
																					</form>
																					<a class="dropdown-item" onclick="
																						if(confirm(`{$CONFIRM_DELETE}`)){
																							$('#form-delete-{$item.id}').submit();
																						}">{$DELETE}</a>
																				{/if}
																			</div>
																		</div>
																		
																	</div>
																</span>
																<div class="product-description">
																	{$item.content}
																</div>
															</div>
														</li>
													</ul>
												{/foreach}
											{/if}

											{if isset($LOGGED_IN_USER)}
												<form action="" method="post" style="display:inline;" id="form-replay-{$post.id}">
													<textarea name="reply" placeholder="{$NEW_REPLY}" class="form-control"></textarea>
													
													<input type="hidden" name="token" value="{$TOKEN}">
													<input type="hidden" name="post" value="{$post.id}">
													<input type="hidden" name="action" value="reply">
													<hr class="w-100">
													<a class="btn btn-danger text-light" data-dismiss="modal">{$CANCEL}</a>
													<input class="btn btn-primary" type="submit" value="{$SUBMIT}">
												</form>
											{else}
												<a class="btn btn-danger text-light" data-dismiss="modal">{$CANCEL}</a>
											{/if}
										</div>
									</div>
									</div>
								</div>
				  			<!-- Post -->
				  			<div class="post clearfix">				  				
								<div class="user-block">
									<img class="img-circle img-bordered-sm" src="{$post.avatar}" alt="{$post.username}">
									<span class="username">
									  <a href="{$post.profile}" style="{$post.user_style}">{$post.username}</a>
									</span>
									<span class="description"><i class="far fa-clock"></i> <span data-toggle="tooltip" title="{$post.date}">{$post.date_rough}</span></span>
									<div class="d-flex">
										<div class="ml-auto btn-tool">
											<div class="dropdown">
												<a data-toggle="dropdown" class="badge badge-light" style="transform: translate(0px, -20px);padding: 0.45rem 0.6rem 0.3rem 0.6rem;position: relative;"><i class="fa fa-ellipsis-v"></i></a>
												<div class="dropdown-menu">
													{if (isset($CAN_MODERATE) && $CAN_MODERATE == 1) || $post.self == 1}
														<a data-toggle="modal" class="dropdown-item"  data-target="#modal-edit-{$post.id}">{$EDIT}</a>
                        								<a  class="dropdown-item"  onclick="{literal}if(confirm(confirmDelete)){$('#form-delete-post-{/literal}{$post.id}{literal}').submit();}{/literal}">{$DELETE}</a>
													{/if}
												</div>
											</div>
										</div>
									</div>
							  </div>
							  
							  <!-- /.user-block -->
							  <p>
								  {$post.content}
							  </p>
								{if isset($post.replies.replies)}
							  		<hr class="no-last">
									{assign var="i" value="0"}
									{foreach from=$post.replies.replies item=item name="replays"}
									{assign var="i" value="{counter}"}
										{if ($i <= 3)}
											<ul class="products-list product-list-in-card pl-2 pr-2">
												<li class="item">
													<div class="product-img">
														<img src="{$item.avatar}" alt="{$item.username}" class="img-size-50 img-circle">
													</div>
													<div class="product-info d-flex flex-column">
														<span class="d-flex">
															<a href="{$item.profile}" class="product-title" style="{$item.style}">{$item.username}</a>
															
															<div class="ml-auto font-normal text-muted font-small">
																<i class="far fa-clock"></i> 
																<span class="date" data-toggle="tooltip" data-content="{$item.time_full}">{$item.time_friendly}</span> 
																<div class="dropdown d-inline-block">
																	<a data-toggle="dropdown" class="btn btn-light"><i class="fa fa-ellipsis-v"></i></a>
																	<div class="dropdown-menu">
																		{if (isset($CAN_MODERATE) && $CAN_MODERATE eq 1) || $post.self eq 1}
																			<form hidden action="" method="post" id="form-delete-{$item.id}">
																		  		<input type="hidden" name="action" value="deleteReply">
																		  		<input type="hidden" name="token" value="{$TOKEN}">
																		  		<input type="hidden" name="post_id" value="{$item.id}">
																			</form>
																			<a class="dropdown-item" onclick="
																				if(confirm(`{$CONFIRM_DELETE}`)){
																					$('#form-delete-{$item.id}').submit();
																				}">{$DELETE}</a>
																	  	{/if}
																	</div>
																</div>
																
															</div>
														</span>
														<div class="product-description">
															{$item.content}
														</div>
													</div>
												</li>
											</ul>
										{/if}
									{/foreach}
									{if (count($post.replies.replies) >= 3)}
                        				<a data-toggle="modal" data-target="#modal-reply-{$post.id}" class="btn btn-light btn-block">{$REPLY} {if ($post.replies.count|regex_replace:'/[^0-9]+/':'' != 0)}({$post.replies.count|regex_replace:'/[^0-9]+/':''}){/if}</a>
									{/if}
								{/if}
							  	<hr class="no-last">
								<form action="" method="post" class="form-horizontal" id="form-replay-{$post.id}">
									<div class="input-group input-group-sm mb-0">
										<input name="reply" class="form-control form-control-sm" placeholder="{$NEW_REPLY}">
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
										</div>
									</div>
									<input type="hidden" name="token" value="{$TOKEN}">
									<input type="hidden" name="post" value="{$post.id}">
									<input type="hidden" name="action" value="reply">
								</form>
							</div>
						{/foreach}
					{else}
						<div class="alert alert-info">
							<i class="fa fa-frown"></i>	{$NO_WALL_POSTS} 
						</div>
					{/if}
				</div>

				{foreach from=$TABS item=item key=key}
						{if ($key !="friends")}
						<div class="tab-pane" id="{$key}">
							{include file={$item.include}}
						</div>
					{/if}
				{/foreach}
				<!-- /.tab-pane -->
			  </div>
			  <!-- /.tab-content -->
			</div><!-- /.card-body -->
		  </div>
		  <!-- /.nav-tabs-custom -->
		</div>
		<!-- /.col -->
	  </div>
	  <!-- /.row -->
	</div><!-- /.container-fluid -->
  </section>
  
{if isset($LOGGED_IN)}
{if isset($SELF)}
  <!-- Change background image modal -->
  <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="imageModalLabel">{$CHANGE_BANNER}</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <form action="" name="updateBanner" method="post" style="display:inline;">
			<select name="banner" class="image-picker show-html">
			  {foreach from=$BANNERS item=banner}
				<option data-img-src="{$banner.src}" value="{$banner.name}"{if $banner.active == true} selected{/if}>{$banner.name}</option>
			  {/foreach}
			</select>
			<input type="hidden" name="token" value="{$TOKEN}">
			<input type="hidden" name="action" value="banner">
		  </form>

		  {if isset($PROFILE_BANNER)}
			<hr />
			<strong>{$UPLOAD_PROFILE_BANNER}</strong>
			<br />
			<form action="{$UPLOAD_BANNER_URL}" method="post" enctype="multipart/form-data" style="display:inline;">
				<label class="btn btn-secondary" style="margin-bottom: 0">
				  {$BROWSE} <input type="file" name="file" hidden/>
				</label>
				<input type="hidden" name="token" value="{$TOKEN}">
				<input type="hidden" name="type" value="profile_banner">
				<input type="submit" value="{$UPLOAD}" class="btn btn-primary">
		  {/if}
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-danger" data-dismiss="modal">{$CANCEL}</button>
		  <button type="button" onclick="document.updateBanner.submit()" class="btn btn-primary">{$SUBMIT}</button>
		</div>
	  </div>
	</div>
  </div>
{else}
  {if $MOD_OR_ADMIN ne true}
  <!-- user modal -->
  <div class="modal fade" id="blockModal" tabindex="-1" role="dialog" aria-labelledby="blockModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="blockModalLabel">{if isset($BLOCK_USER)}{$BLOCK_USER}{else}{$UNBLOCK_USER}{/if}</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<form action="" method="post" style="display:inline;" >
		  <div class="modal-body">
			<p>{if isset($CONFIRM_BLOCK_USER)}{$CONFIRM_BLOCK_USER}{else}{$CONFIRM_UNBLOCK_USER}{/if}</p>
			<input type="hidden" name="token" value="{$TOKEN}">
			<input type="hidden" name="action" value="block">
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-danger" data-dismiss="modal">{$CANCEL}</button>
			<input type="submit" class="btn btn-primary" value="{$CONFIRM}">
		  </div>
		</form>
	  </div>
	</div>
  </div>
  {/if}
{/if}
{/if}

{include file='footer.tpl'}
{else}
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="refresh" content="0; url={$SITE_HOME}">
	</head>
	<body>
		{$PRIVATE_PROFILE}
	</body>
	</html>
{/if}