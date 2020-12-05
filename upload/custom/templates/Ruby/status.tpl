{include file='header.tpl'}

<div class="card">
    <div class="card-body">
        <h2>
            {$TITLE}
        </h2>
        {if isset($CLICK_TO_COPY_TOOLTIP)}
            <div class="alert alert-info mb-2 w-100" onclick="copyToClipboard('#ip')" data-toggle="tooltip" title="{$CLICK_TO_COPY_TOOLTIP}">{$CONNECT_WITH}</div>
        {/if}

        {if count($SERVERS)}
            {foreach from=$SERVERS item=server name=serverArray}
                <div class="callout callout-info">
                    <h5>{$server->name}</h5>
                    <div class="d-flex align-items-center">
                        <span class="mr-auto" id="status-{$server->id}">
                            <i class="fa fa-circle"></i> 0/0
                        </span>
                        <span class="ml-auto">
                            {$server->ip} {if $server->port && $server->port != 25565}:{$server->port|escape:'html'}{/if}
                        </span>
                    </div>
                </div>
            {/foreach}
        {else}
            <div class="d-flex align-items-center text-danger">
                {$NO_SERVERS}
            </div>
        {/if}
    </div>
</div>

{include file='footer.tpl'}
