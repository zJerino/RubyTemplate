{include file='header.tpl'}

<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-5 col-sm-3">
              <div class="nav flex-column nav-tabs h-100" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link active" id="home-tab" data-toggle="pill" href="#hometap" role="tab" aria-controls="hometap" aria-selected="true"><i class="fas fa-gavel"></i> {$RULES}</a>
                {foreach from=$CATAGORIES item=catagory}
                    <a class="nav-link" id="id-{$catagory.id}-tab" data-toggle="pill" href="#id-{$catagory.id}" role="tab" aria-controls="id-{$catagory.id}" aria-selected="false">
                        {if (isset($catagory.icon && !empty($catagory.icon)))}
                            {$catagory.icon}
                        {/if}
                        {$catagory.name}</a>
                {/foreach}
            </div>
            </div>
            <div class="col-7 col-sm-9">
              <div class="tab-content" id="vert-tabs-tabContent">
                <div class="tab-pane text-left fade show active" id="hometap" role="tabpanel" aria-labelledby="home-tab">
                    {$MESSAGE}
                    {if !empty($BUTTONS)}
                        <br />
                        <div style="text-align:center">
                            {foreach from=$BUTTONS item=button}
                                <a class="btn btn-primary" href="{$button.link}" style="margin-left: 5px; margin-right: 5px">{$button.name}</a>
                            {/foreach}
                        </div>
                    {/if} 
                </div>
                {foreach from=$CATAGORIES item=catagory}
                    <div class="tab-pane fade" id="id-{$catagory.id}" role="tabpanel" aria-labelledby="id-{$catagory.id}-tab">{$catagory.rules}</div>
                {/foreach}
              </div>
            </div>
          </div>
    </div>
</div>
{include file='footer.tpl'}