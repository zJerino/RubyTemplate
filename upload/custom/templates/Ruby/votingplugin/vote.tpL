
{include file='header.tpl'}
    <div class="card card-outline card-primary">
        <div class="card-header">
            {$TITLE}            
        </div>
        <div class="card-body">
            {if (count($VOTE_SITES))}
                <div class="row justify-content-center">
                    {foreach from=$VOTE_SITES_LIST item=item}
                        <div class="col-lg-4 col-12">
                            <a href="{$item.site}" class="btn btn-info btn-block">{$item.name}</a>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="alert alert-danger">
                    {$NO_SERVERS}
                </div>
            {/if}
        </div>
    </div>
{include file='footer.tpl'}
	