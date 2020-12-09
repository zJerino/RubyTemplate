{include file='header.tpl'}
    <style>
        roles > .badge {
            width: 60%;
            border-radius: 0.15rem;
        }
        roles {
            width: 100%;
            text-align: center;
        }
        .content_second>* {
            margin: 0;
            padding: 0;
            color: initial;
        }
    </style>
    <div class="container-fluid">
        <div class="card card-primary">
            <div class="card-body">
                <div class="d-flex flex-column flex-sm-row justify-content-center" >
                    <div class="p-0 mb-sm-0 mb-2" style="width: 100%;">
                        <ol class="breadcrumb w-100 m-0">
                            {foreach from=$BREADCRUMBS item=breadcrumb}
                                <li class="breadcrumb-item{if isset($breadcrumb.active)} active{/if}">{if !isset($breadcrumb.active)}
                                    <a href="{$breadcrumb.link}">{/if}{$breadcrumb.forum_title}{if !isset($breadcrumb.active)}</a>{/if}
                                </li>
                            {/foreach}
                        </ol>
                    </div>
                    <div class="justify-content-center d-flex">
                        {if isset($UNFOLLOW)}
                            <a class="btn btn-primary mx-1" style="align-self: center" href="{$UNFOLLOW_URL}">{$UNFOLLOW}</a>
                        {else if isset($FOLLOW)}
                            <a class="btn btn-primary mx-1" style="align-self: center" href="{$FOLLOW_URL}">{$FOLLOW}</a>
                        {/if}
                        {if isset($CAN_MODERATE)}
                            <div class="btn-group mx-1"> 
                                <button type="button" style="vertical-align:baseline; align-self: center" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">{$MOD_ACTIONS} <span class="caret"></span></button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a class="dropdown-item" href="{$LOCK_URL}">{$LOCK}</a></li>
                                    <li><a class="dropdown-item" href="{$MERGE_URL}">{$MERGE}</a></li>
                                    <li><a class="dropdown-item" href="" data-toggle="modal" data-target="#deleteModal">{$DELETE}</a></li>
                                    <li><a class="dropdown-item" href="{$MOVE_URL}">{$MOVE}</a></li>
                                    <li><a class="dropdown-item" href="{$STICK_URL}">{$STICK}</a></li>
                                </ul>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>

        
        

        {foreach from=$REPLIES item=reply name=arr}
            <div class="card card-primary">
                <div class="card-body" id="post-{$reply.id}">
                    <div class="d-flex flex-column flex-sm-row">
                        <div id="seccion_user" style="padding-right: 0.5rem;border-right: 1px dashed #5554;width: 100%;flex: 0 0 35%;" class="align-items-center d-flex flex-column">
                            <img loading="lazy" src="{$reply.avatar}" alt="{$reply.username}" class="mb-1" srcset="{$reply.avatar}" style="width: 8em;height: 8em;border: 1px solid {if ($reply.online_now == true)} green {else} #605f5f4f {/if};border-radius: 50%;">
                            <a style="{$reply.user_style}" class="mb-1" href="{$reply.profile}">{$reply.username}</a>
                            <roles class="mb-2">
                                {foreach from=$reply.user_groups item=item}
                                    {$item}
                                {/foreach}
                            </roles>
                            {if (!isset($reply.mcname))}
                                <div class="badge badge-light">
                                    <img src="https://cravatar.eu/helmhead/{$reply.mcname}/" loading="lazy" alt="{$reply.mcname}" srcset="https://cravatar.eu/helmavatar/{$reply.mcname}/">
                                </div>
                            {/if}
                            <hr class="w-100">
                            <span>
                                <i class="far fa-comment-alt"></i> {$reply.user_posts_count|capitalize}
                            </span>
                            <hr class="w-100">
                            {if count($reply.buttons)}
                                <div class="dropdown">
                                    <div class="btn btn-block btn-outline-primary dropdown-toggle" data-toggle="dropdown">
                                        {$ACTIONS_a}
                                    </div>
                                    <div class="dropdown-menu">
                                        {foreach from=$reply.buttons item=itemd key=keyd}
                                            <a 
                                            {if ($keyd == "edit")}
                                                href="{$itemd.URL}"
                                            {elseif ($keyd == "quote")}
                                                 onclick="quote({$reply.id});"
                                            {else}
                                                data-toggle="modal" data-target="#{$keyd}{$reply.id}Modal"
                                            {/if}
                                            class="dropdown-item" style="cursor: pointer;">{$itemd.TEXT}</a>
                                        {/foreach}
                                    </div>
                                </div>
                            {/if}
                            <hr class="w-100 d-block d-sm-none">
                        </div>
                        <div id="seccion_content" class="d-flex flex-column" style="width: 100%;padding-left: 0.5rem;flex: 0 0 65%;">
                            <div class="content_firts">
                                {$reply.content|replace:"<img ":"<img class='w-100 h-auto'"}
                            </div>
                            <div class="content_second mt-auto">
                                {if (!empty($reply.signature))}
                                    <hr class="w-100">
                                    {$reply.signature}
                                {/if}
                            </div>
                            <div class="content_react d-flex">
                                <div class="mr-auto d-flex">
                                    {if (isset($LOGGED_IN_USER) && $reply.user_id != $USER_ID)}
                                        {if isset($REACTIONS) && count($REACTIONS)}
                                            {foreach from=$REACTIONS item=reaction}
                                                <form action="{$REACTIONS_URL}" method="post" class="mx-1">
                                                    <input type="hidden" name="token" value="{$TOKEN}">
                                                    <input type="hidden" name="reaction" value="{$reaction->id}">
                                                    <input type="hidden" name="post" value="{$reply.id}">
                                                    <button type="submit" class="btn btn-sm btn-light">{$reaction->html}</button>
                                                </form>
                                            {/foreach}
                                        {/if}
                                    {/if}
                                </div>
                                <div class="ml-auto d-flex" style="align-self: center;">
                                    {if count($reply.post_reactions)}
                                        <span style="align-self: center;">{$REACTIONS_TEXT}: &nbsp;</span>
                                        {foreach from=$reply.post_reactions name=reactions item=reaction}
                                            <a data-toggle="modal" data-target="#reacciones-{$reply.id}" class="btn btn-sm btn-light mr-1" style="height: min-content;">
                                                {$reaction.html} x {$reaction.count}
                                            </a>
                                        {/foreach}
                                        <div class="modal fade" id="reacciones-{$reply.id}" tabindex="-1" role="dialog" aria-labelledby="reacciones-{$reply.id}ModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="reacciones-{$reply.id}ModalLabel">{$REACTIONS_TEXT}</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        {foreach from=$reply.post_reactions name=reactions item=reaction}
                                                            <strong>{$reaction.html} x {$reaction.count}:</strong>
                                                            <br />
                                                            <div class="d-flex flex-column">
                                                                {foreach from=$reaction.users item=user}
                                                                    <div class="user-block" style="display: flex;align-items: center;">
                                                                        <img class="img-circle" src="{$user.avatar}" loading="lazy" style="width: 2.4em;height: 2.4em;" alt="zJerino">
                                                                        <span class="username ml-1"><a href="{$user.profile}" style="{$user.style}">{$user.nickname}</a></span>
                                                                    </div>
                                                                {/foreach}
                                                            </div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            {if isset($reply.buttons.report)}
                    <!-- Post report modal -->
                    <div class="modal fade" id="report{$reply.id}Modal" tabindex="-1" role="dialog"
                         aria-labelledby="report{$reply.id}ModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"
                                        id="report{$reply.id}ModalLabel">{$reply.buttons.report.TEXT}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                {if ($LOGGED_IN_USER.username === $reply.username)}
                                    <div class="modal-body">
                                        <span class="text-danger">ERROR T#0001!</span>
                                    </div>
                                {else}
                                    <form action="{$reply.buttons.report.URL}" method="post">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="InputReason">{$reply.buttons.report.REPORT_TEXT}</label>
                                                <textarea class="form-control" id="InputReason" name="reason"></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-warning"
                                                    data-dismiss="modal">{$CANCEL}</button>
                                            <input type="hidden" name="post" value="{$reply.id}">
                                            <input type="hidden" name="topic" value="{$TOPIC_ID}">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <input type="submit" class="btn btn-danger"
                                                value="{$reply.buttons.report.TEXT}">
                                        </div>
                                    </form>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}

                {if isset($CAN_MODERATE)}
                    <!-- Post spam modal -->
                    <div class="modal fade" id="spam{$reply.id}Modal" tabindex="-1" role="dialog"
                         aria-labelledby="spam{$reply.id}ModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="spam{$reply.id}ModalLabel">{$MARK_AS_SPAM}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    {$CONFIRM_SPAM_POST}
                                </div>

                                <div class="modal-footer">
                                    {if ($LOGGED_IN_USER.username === $reply.username)}
                                        <span class="text-danger">ERROR T#0002!</span>
                                        <input type="submit" class="btn btn-danger disabled" value="{$MARK_AS_SPAM}">
                                    {else}
                                        <form action="{$reply.buttons.spam.URL}" method="post">
                                            <button type="button" class="btn btn-warning"
                                                    data-dismiss="modal">{$CANCEL}</button>
                                            <input type="hidden" name="post" value="{$reply.id}">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <input type="submit" class="btn btn-danger" value="{$MARK_AS_SPAM}">
                                        </form>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Post deletion modal -->
                    <div class="modal fade" id="delete{$reply.id}Modal" tabindex="-1" role="dialog"
                         aria-labelledby="delete{$reply.id}ModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"
                                        id="delete{$reply.id}ModalLabel">{$CONFIRM_DELETE_SHORT}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    {$CONFIRM_DELETE_POST}
                                </div>
                                <div class="modal-footer">
                                    <form action="{$reply.buttons.delete.URL}" method="post">
                                        <button type="button" class="btn btn-warning"
                                                data-dismiss="modal">{$CANCEL}</button>
                                        <input type="hidden" name="tid" value="{$TOPIC_ID}">
                                        <input type="hidden" name="number" value="{$reply.buttons.delete.NUMBER}">
                                        <input type="hidden" name="pid" value="{$reply.id}">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="submit" class="btn btn-danger"
                                               value="{$reply.buttons.delete.TEXT}">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
        {/foreach}
        {if (isset($LOGGED_IN_USER))}
            <div class="card card-primary">
                <div class="card-body">
                    {if isset($CAN_REPLY)}
                        <div class="d-flex flex-column flex-sm-row">
                            <div id="seccion_user" class="d-flex flex-column " style="padding-right: 0.5rem;border-right: 1px dashed #5554;width: 100%;flex: 0 0 35%;align-items: center;">
                                {if (isset($LOGGED_IN_USER))}
                                    <img loading="lazy" src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="mb-1" srcset="{$LOGGED_IN_USER.avatar}" style="width: 8em;height: 8em;border: 1px solid green;border-radius: 50%;">
                                    <a style="{$LOGGED_IN_USER.username_style}" class="mb-1" href="{$LOGGED_IN_USER.profile}">{$LOGGED_IN_USER.username}</a>
                                {/if}
                            </div>
                            <div id="seccion_content" class="d-flex flex-column" style="width: 100%;padding-left: 0.5rem;flex: 0 0 65%;">
                                <form action="" method="post">
                                    {if isset($MARKDOWN)}
                                        <div class="form-group">
                                            <textarea name="content" class="form-control" placeholder="{$LOADING}" id="markdown" >{$CONTENT}</textarea>
                                        </div>
                                    {else}
                                        <div class="form-group">
                                            <textarea name="content" class="form-control" placeholder="{$LOADING}" id="quickreply">{$CONTENT}</textarea>
                                        </div>
                                    {/if}
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <button class="btn btn-primary" type="submit">{$SUBMIT}</button>
                                    <button class="btn btn-warning" id="quoteButton" type="button" onclick="insertQuotes();">{$INSERT_QUOTES}</button>
                                </form>
                            </div>
                        </div>
                        
                    {/if}
                </div>
            </div>
        {/if}
    </div>

{assign var="tinyMCESET" value="true"}
{include file='footer.tpl'}

{if isset($CAN_MODERATE)}
    <!-- Deletion modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">{$CONFIRM_DELETE_SHORT}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">{$CANCEL}</button>
                    <a href="{$DELETE_URL}" class="btn btn-danger">{$DELETE}</a>
                </div>
            </div>
        </div>
    </div>
{/if}
