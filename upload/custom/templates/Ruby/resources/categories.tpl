<div class="card card-primary card-outline">
	<div class="card-header">
		<div class="card-title">
			{$CATEGORIES_TITLE}
		</div>
  </div>
  <div class="card-body">
    <ul class="nav nav-pills flex-column">
      {if (count($CATEGORIES))}
        {foreach from=$CATEGORIES item=item}
          <li class="nav-item">
            <a class="nav-link{if isset($item.active)} active{/if}" href="{$item.link}">{$item.name}</a>
          </li>
        {/foreach}
      {else}
          <div class="text-danger d-block text-center">Empty :(</div>
      {/if}
    </ul>
  </div>
</div>