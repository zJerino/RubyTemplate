
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
        <div class="container-fluid">
          <a class="navbar-brand d-block d-lg-none" sidebar-toggle aria-expanded="false" aria-label="Toggle navigation" role="button"><i class="fas fa-bars"></i></a>
          <a href="{$SITE_HOME}" class="navbar-brand">
            <span class="brand-text font-weight-light">{$SITE_NAME}</span>
          </a>
          
          <div class="collapse navbar-collapse order-3 d-flex justify-content-center" id="navbarCollapse">
            <form class="form-inline m-0 d-none d-sm-none" role="form" method="post" action="{$SEARCH_ACTION}"  style="width: 100%;justify-content: center;">
              <div class="input-group w-25">
                <input class="form-control form-control-navbar" type="search" placeholder="{$SEARCH_LABEL}" name="forum_search" aria-label="{$SEARCH_LABEL}">
                <div class="input-group-append">
                  <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </div>
              <input type="hidden" name="token" value="{$BUSQUEDA_TOKEN}">
            </form>
          </div>
    
          <!-- Right navbar links -->
          <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto" >
            {if (isset($USER_SECTION))}
              {if (isset($USER_SECTION.pms))}
                <li class="nav-item dropdown">
                  <a class="nav-link" data-toggle="dropdown" style="display: flex;align-items: center;">
                    <i class="far fa-comments" id="pms-icon"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="max-width: initial; margin-top: -3px;">
                    <span class="dropdown-header">{$USER_SECTION.pms.title}</span>
                    <div class="dropdown-divider"></div>
                    <div class="dropdown-content" id="DropPMS">
                      {$LOADING}
                    </div>
                    <div class="dropdown-divider"></div>
                    <a href="{$USER_SECTION.pms.link}" class="dropdown-item dropdown-footer">{$USER_SECTION.pms.meta}</a>
                  </div>
                </li>
              {/if}
              {if isset($USER_SECTION.alerts)}
                <!-- Notifications Dropdown Menu -->
                <li class="nav-item dropdown">
                  <a class="nav-link" data-toggle="dropdown" style="display: flex;align-items: center;">
                    <i class="far fa-bell" id="alerts-icon"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="max-width: initial; margin-top: -3px;">
                    <span class="dropdown-header">{$USER_SECTION.alerts.title}</span>
                    <div class="dropdown-divider"></div>
                    <div class="dropdown-content" id="DropALERTS">
                      {$LOADING}
                    </div>
                    <div class="dropdown-divider"></div>
                    <a href="{$USER_SECTION.alerts.link}" class="dropdown-item dropdown-footer">{$USER_SECTION.alerts.meta}</a>
                  </div>
                </li>
              {/if}
            {/if}

            {if isset($USER_SECTION.login)}
              <li class="nav-item">
                <a class="nav-link" href="{$USER_SECTION.login.link}" role="button"  style="display: flex;align-items: center;"><i class="fas fa-user-lock"></i> &nbsp; {$USER_SECTION.login.title}</a>
              </li>
            {/if}
            {if isset($USER_SECTION.panel)}
              <li class="nav-item d-lg-flex d-none">
                <a class="nav-link" href="{$USER_SECTION.panel.link}" role="button" target style="display: flex;align-items: center;"><i class="fas fa-cogs"></i></a>
              </li>
            {/if}
            {if isset($USER_SECTION.register)}
              <li class="nav-item">
                <a class="nav-link" href="{$USER_SECTION.register.link}" role="button"  style="display: flex;align-items: center;"><i class="fa fa-user-plus"></i> &nbsp; {$USER_SECTION.register.title}</a>
              </li>
            {/if}
            {if isset($USER_SECTION.account)}
              <li class="nav-item dropdown">
                <a class="nav-link"  data-turbolinks-permanent data-toggle="dropdown" role="button"  style="display: flex;align-items: center;cursor: pointer;"><i class="far fa-user"></i> <span class="d-none d-sm-block"> &nbsp; {$USER_SECTION.account.title}</span></a>
                <div class="dropdown-menu dropdown-menu-md dropdown-menu-lg">
                  <div class="dropdown-header h-acount">
                    {$USER_SECTION.account.icon}
                    {$USER_SECTION.account.title}
                  </div>
                  <div class="dropdown-divider"></div>
                  <a href="{$USER_SECTION.account.items.profile.link}" class="dropdown-item"><i class="fa fa-address-card"></i> {$USER_SECTION.account.items.profile.title}</a>
                  <a href="{$USER_SECTION.account.items.user.link}" class="dropdown-item"><i class="fa fa-user-cog"></i> {$USER_SECTION.account.items.user.title}</a>
                  <div class="dropdown-divider"></div>
                  {if isset($USER_SECTION.panel)}
                    <a href="{$USER_SECTION.panel.link}" class="dropdown-item">{$USER_SECTION.panel.icon} {$USER_SECTION.panel.title}</a>
                  {/if}
                  <div class="dropdown-divider"></div>
                  <a href="{$USER_SECTION.account.items.logout.link}" class="dropdown-item"><i class="fa fa-door-open"></i> {$USER_SECTION.account.items.logout.title}</a>
                </div>
              </li>
            {/if}
            <li class="nav-item">
              <a class="nav-link" role="button" style="display: flex;align-items: center;"><i class="fa fa-mode"></i></a>
            </li>
            <li class="nav-item d-none" id="SuperK">
              <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button"  style="display: flex;align-items: center;"><i class="fas fa-th-large"></i></a>
            </li>
          </ul>
        </div>
      </nav>
      {if isset($CONFIG.SMARTY_DEBUG) && $CONFIG.SMARTY_DEBUG == "true"}
        
      {/if}
       
      <!-- /.navbar -->
    
      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4" id="flojo">
        <!-- Brand Logo -->
        <a href="{$SITE_HOME}" class="brand-link">
          <span class="brand-text font-weight-light">{$SITE_NAME}</span>
        </a>
    
        <!-- Sidebar -->
        <div class="sidebar">
          <!-- Sidebar user (optional) -->
          {if isset($LOGGED_IN_USER)}
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                <img src="{$LOGGED_IN_USER.avatar}" class="img-circle elevation-0 border-success" style="border: 1px solid;" alt="{$LOGGED_IN_USER.username}">
                </div>
                <div class="info">
                <a href="{$LOGGED_IN_USER.profile}" style="{$LOGGED_IN_USER.username_style}" class="d-block">{$LOGGED_IN_USER.username}</a>
                  <span>
                    {$LOGGED_IN_USER.user_title}
                  </span>
                </div>
            </div>
          {/if}
    
          <!-- Sidebar Menu -->
          <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->
              
            {if (isset($BACKEND) && $BACKEND == "true")}
                {foreach from=$NAV_LINKS key=name item=item}
                  {if isset($item.link) && $item.link eq "divider"}
                      <li class="nav-header">{$item.title}</li>
                  {else}
                      {if isset($item.items)}
                          {* Dropdown *}
                          <li class="nav-item has-treeview{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} menu-open{/if}">
                              <a class="nav-link{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} active{/if}" style="cursor:pointer;">
                                  {$item.icon}
                                  <p>
                                      {$item.title}
                                      <i class="right fa fa-angle-left"></i>
                                  </p>
                              </a>
                              <ul class="nav nav-treeview">
                                  {if count($item.items)}
                                      {foreach from=$item.items key=subKey item=subItem}
                                          <li class="nav-item">
                                              <a href="{$subItem.link}" target style="margin-left:10px;" class="nav-link{if $PAGE eq $subKey} active{/if}">
                                                  {$subItem.icon}
                                                  <p>{$subItem.title}</p>
                                              </a>
                                          </li>
                                      {/foreach}
                                  {/if}
                              </ul>
                          </li>
                      {else}
                          {* Normal link *}
                          <li class="nav-item">
                              <a class="nav-link{if $PAGE eq $name} active{/if}" href="{$item.link}" target="{$item.target}">
                                  {$item.icon}
                                  <p>
                                      {$item.title}
                                  </p>
                              </a>
                          </li>
                      {/if}
                  {/if}
              {/foreach}
            {else}
                {foreach from=$NAV_LINKS item=item}
                  {if (isset($item.type) && $item.type == "dropdown")}
                      <li class="nav-item has-treeview">
                          <a href="#" class="nav-link">
                              <span class="nav-icon">
                                  {if (!empty($item.icon))}
                                      {$item.icon}
                                  {else}
                                      <i class="far fa-circle"></i>
                                  {/if}
                              </span>
                          <p>
                              {$item.title}
                              <i class="right fas fa-angle-left"></i>
                          </p>
                          </a>
                          <ul class="nav nav-treeview">
                              {foreach from=$item.items item=dropdown}
                                  <li class="nav-item">
                                      <a href="{$dropdown.link}" class="nav-link">
                                          <span class="nav-icon">
                                              {if (!empty($dropdown.icon))}
                                                  {$dropdown.icon}
                                              {else}
                                                  <i class="fas fa-plus"></i>
                                              {/if}
                                          </span>
                                          <p>{$dropdown.title}</p>
                                      </a>
                                  </li>
                              {/foreach}
                          </ul>
                      </li>
                  {else}
                      <li class="nav-item">
                          <a href="{$item.link}" class="nav-link  {if (isset($item.active))}active{/if}">
                              <span class="nav-icon">
                                  {if (!empty($item.icon))}
                                      {$item.icon}
                                  {else}
                                      <i class="far fa-circle"></i>
                                  {/if}
                              </span>
                              <p>{$item.title}</p>
                          </a>
                      </li>
                  {/if}
                {/foreach}
            {/if}
            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
      </aside>
    