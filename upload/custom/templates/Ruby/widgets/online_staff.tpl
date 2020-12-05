<div class="card card-{$RUBY.WIDGETS.COLOR} card-{$RUBY.WIDGETS.LAYOUT}">
    <div class="card-header">
      <h5 class="card-title m-0">{$ONLINE_STAFF}</h5>
    </div>
    <div class="card-body">
        {if isset($ONLINE_STAFF_LIST)}
            {if (count($ONLINE_STAFF_LIST) >= 5)}
                {foreach from=$ONLINE_STAFF_LIST name=online_staff_arr item=user}
                    <span class="mr-1"><a style="{$user.style}" href="{$user.profile}" data-poload="{$USER_INFO_URL}{$user.id}" data-html="true" data-placement="top">{if $SHOW_NICKNAME_INSTEAD}{$user.nickname}{else}{$user.username}{/if}</a>{if not $smarty.foreach.online_staff_arr.last}, {/if}</span>
                {/foreach}
            {else}
                <span class="d-flex flex-column">
                    {foreach from=$ONLINE_STAFF_LIST name=online_staff_arr item=user}
                        <span class="d-flex">
                            <span>
                                <img src="{$user.avatar}" alt="{$user.nickname}" class="img-circle mr-2" style="max-width: 2.5rem;"> 
                            </span>
                            <span>
                                <dl>
                                    <dt><a style="{$user.style}" href="{$user.profile}" data-poload="{$USER_INFO_URL}{$user.id}" data-html="true" data-placement="top">{$user.username}</a></dt>
                                    <dd id="badge-max">{$user.group}</dd>
                                </dl>
                            </span>
                        </span>
                    {/foreach}
                </span>
            {/if}
        {else}
            {$NO_STAFF_ONLINE}
        {/if}
    </div>
</div>