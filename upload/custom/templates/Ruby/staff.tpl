{include file='header.tpl'}
    <h2>
        {$TITLE}
    </h2>

    {foreach from=$STAFF_GROUPS item=staff}
        <div class="card card-outline {if (!count($staff.members))}d-none{/if}">
            <div class="card-header border-bottom-0" style="{$staff.style}">
                <div class="card-title">
                    {$staff.name}
                </div>
            </div>
            <div class="card-body row row-cols-5">
                {foreach from=$staff.members item=item}
                    <div class="col-sm-3">
                        <div class="d-flex flex-column text-center align-items-center">
                            <img src="{$item.avatar}" class="img-circle img-size-64" alt="{$item.username}" loading="lazy" srcset="{$item.avatar}">
                            <span style="{$item.style}">{$item.username}</span>
                            <small>{$item.title}</small>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    {/foreach}
    
{include file='footer.tpl'}
	