<div class="card card-{$RUBY.WIDGETS.COLOR} card-{$RUBY.WIDGETS.LAYOUT}">
  <div class="card-header">
    <h5 class="card-title m-0">{$STATISTICS}</h5>
  </div>
  <div class="card-body">
    <dl class="row mb-0 ">
      {if isset($FORUM_STATISTICS)}
        <dt class="col-sm">{$TOTAL_THREADS}</dt>
        <dd class="col-sm-2 m-0" style="text-align: end;">{$TOTAL_THREADS_VALUE}</dd>
        
        <span class="col-12 m-0 p-0"></span>
        
        <dt class="col-sm">{$TOTAL_POSTS}</dt>
        <dd class="col-sm-2 m-0" style="text-align: end;">{$TOTAL_POSTS_VALUE}</dd>
        
        <span class="col-12 m-0 p-0"></span>
      {/if}
      
      <dt class="col-sm">{$USERS_REGISTERED}</dt>
      <dd class="col-sm-2 m-0" style="text-align: end;">{$USERS_REGISTERED_VALUE}</dd>
      
      <span class="col-12 m-0 p-0"></span>
            
      <dt class="col-sm">{$LATEST_MEMBER}</dt>
      <dd class="col-sm-5 m-0" style="text-align: end;"><a style="{$LAST_MEMBER_VALUE.style}" href="{$LATEST_MEMBER_VALUE.profile}" data-poload="{$USER_INFO_URL}{$LATEST_MEMBER_VALUE.id}" data-html="true" data-placement="top">{$LATEST_MEMBER_VALUE.nickname}</a></dd>
      
    </dl>
  </div>
</div>