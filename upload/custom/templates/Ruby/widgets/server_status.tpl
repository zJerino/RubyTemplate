<div class="card card-{$RUBY.WIDGETS.COLOR} card-{$RUBY.WIDGETS.LAYOUT}">
    <div class="card-header">
      <h5 class="card-title m-0">{$SERVER_STATUS}</h5>
    </div>
    <div class="card-body">
        {if isset($SERVER)}
            <ul class="nav nav-pills flex-column">
                {if $SERVER.status_value eq 1}
                    <li class="nav-item">
                        <a class="nav-link text-dark">
                            {$SERVER_STATUS}
                            <span class="float-right text-success"> <i class="fas fa-arrow-up text-sm"></i> {$ONLINE}</span>
                        </a>
                    </li>
                {else}
                    <li class="nav-item">
                        <a class="nav-link text-dark">
                            {$SERVER_STATUS}
                            <span class="float-right text-danger"> <i class="fas fa-arrow-down text-sm"></i> {$OFFLINE}</span>
                        </a>
                    </li>
                {/if}
                {if $SERVER.status_value eq 1}
                    <li class="nav-item">
                        <a class="nav-link text-dark">
                            {$ONLINE}:
                            <span class="float-right"> <i class="fas fa-users text-sm"></i> <strong>{$SERVER.player_count} / {$SERVER.player_count_max}</strong></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark">
                            {$VERSION}
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark">
                            {$IP}:
                            <span class="float-right">{$SERVER.join_at}</span>
                        </a>
                    </li>
                {/if}
            </ul>
        {else}
            <span class="text-danger">
                {$NO_SERVERS}
            </span>
        {/if}
    </div>
</div>