{assign var="BACKEND" value="true"}
{assign var="SELECT2_PLUGINADD" value="true"}
{include file='../../../../custom/templates/Ruby/header.tpl'}

<div class="container-fluid">
	<div class="card card-primary card-outline">
		<div class="card-body">
			<div class="d-flex flex-column">
				<span id="avatar-chido" class="text-center">
					<img src="{$TEMPLATE_INFO.PATH}/assets/img/Ruby.png"  class="img-circle img-size-90" alt="{$LOGGED_IN_USER.username}" >
				</span>
				<span class="text-center d-flex flex-column">
					{$TEMPLATE_INFO.NAME} v{$TEMPLATE_INFO.Version}
				</span>
			</div>
		</div>
	</div>
	{if isset($SUCCESS)}
		<div class="info-box">
			<span class="info-box-icon bg-gradient-success"><i class="fa fa-check-circle fa-1x"></i></span>

			<div class="info-box-content">
				<span class="info-box-text">{$SUCCESS_TITLE}</span>
				<span class="info-box-number">{$SUCCESS}</span>
			</div>
			<!-- /.info-box-content -->
		</div>
	{/if}
	{if isset($ERRORS)}
		<div class="info-box">
			<span class="info-box-icon bg-gradient-danger"><i class="fa fa-times-circle fa-1x"></i></span>

			<div class="info-box-content">
				<span class="info-box-text">{$ERRORS_TITLE}</span>
				<span class="info-box-number">
					{foreach from=$ERRORS item=item}
						{$item}
					{/foreach}
				</span>
			</div>
			<!-- /.info-box-content -->
		</div>
	{/if}
	{if (!empty($CODE))}
		<div class="card card-outline card-primary">
			<div class="card-body">
				<pre style="color: var(--card-c)" onclick="copy(document.querySelector('#container-content > div > div > div:nth-child(2) > div > pre > code'))"><code>{$CODE}</code></pre>
			</div>
		</div>
	{/if}
	<div class="info-box d-none" id="hay_update">
		<span class="info-box-icon bg-gradient-success"><i class="fa fa-arrow-alt-circle-down fa-1x"></i></span>

		<div class="info-box-content">
		<span class="info-box-text">New Update</span>
		<span class="info-box-number" id="update_ver">...</span>
		</div>
		<info-item class="align-self-center">
			<a href="?download" id="download_btn" class="btn btn-info">Download</a>
		</info-item>
		<!-- /.info-box-content -->
	</div>
	<div class="card card-primary card-outline">
		<div class="card-header d-flex flex-column flex-lg-row p-0 text-center">
			<div class="card-title p-3">
				<i class="fa fa-cogs"></i> {$CONFIGURATION}
			</div>
		  <ul class="nav nav-pills ml-auto p-2">
			<li class="nav-item"><a class="nav-link active" href="#tab_1" data-toggle="tab">General</a></li>
			<li class="nav-item"><a class="nav-link" href="#tab_2" data-toggle="tab">Style</a></li>
			<li class="nav-item"><a class="nav-link" href="#fix" data-toggle="tab">FIX</a></li>
			<li class="nav-item"><a class="nav-link" href="#tab_3" data-toggle="tab">Theme Status</a></li>
		  </ul>
		</div><!-- /.card-header -->
		<div class="card-body">
		  <div class="tab-content">
			<div class="tab-pane active" id="tab_1">
				<form action="" method="post">
					<div class="form-group mb-2">
						<label for="SITE_NAME">{$LANG.ADMIN.name}</label>
						<input type="text" id="SITE_NAME" value="{$SITE_NAME}" class="form-control" disabled>
						<a href="{$CONFIG_URL}" class="text-gray" target="">Click me, for change</a>
					</div>
					<div class="form-group mb-2">
						<label for="SITE_DESCRIPTION">{$LANG.ADMIN.desc}</label>
						<input type="text" id="SITE_DESCRIPTION" name="SITE_DESCRIPTION" value="{$VALUES.GENERAL.DESCRIPTION}" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="SITE_FAVICON">FAVICON</label>
						<input type="text" id="SITE_FAVICON" name="SITE_FAVICON" value="{$VALUES.GENERAL.FAVICON}" class="form-control">
					</div>
					<div class="form-group mb-2">
						<label for="SITE_COLOR">APP COLOR</label>
						<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
                    		<input type="text" name="SITE_COLOR" id="SITE_COLOR" value="{$VALUES.GENERAL.COLOR}" class="form-control" data-original-title="" title="">

                    		<div class="input-group-append" >
                      			<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.GENERAL.COLOR};"></i></span>
                    		</div>
                  		</div>
					</div>
					<div class="form-group mb-2">
						<label for="DEFAULT_MODE">DEFAULT MODE <small>x</small></label>
						<div class="input-group">
							<select name="DEFAULT_MODE" id="DEFAULT_MODE" class="form-control">
								<option value="light" {if ($VALUES.GENERAL.DEFAULTMODE == "light")}selected{/if}>Light</option>
								<option value="dark"{if ($VALUES.GENERAL.DEFAULTMODE == "dark")}selected{/if}>DARK</option>
							</select>
                  		</div>
					</div>

					<input type="text" name="token" value="{$TOKEN}" hidden>
					<input type="text" name="GENERAL_S" value="1" hidden>
					<button type="submit" class="btn btn-primary btn-block">{$SUBMIT}</button>
				</form>
				
			</div>
			<!-- /.tab-pane -->
			<div class="tab-pane" id="tab_2">
				<div class="card card-primary card-outline elevation-1 collapsed-card">
					<div class="card-header">
					  <h3 class="card-title">GENERAL SETTINGS</h3>
	  
					  <div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
						</button>
					  </div>
					  <!-- /.card-tools -->
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form action="" method="post">
							<div class="form-group mb-2">
								<label for="WIDGET_LAYOUT">WIDGETS STYLE</label>
								<select name="WIDGET_LAYOUT" class="select2" id="WIDGET_LAYOUT">
									<option {if ($VALUES.WIDGETS.LAYOUT == "default")} selected {/if}  value="default">
										DEFAULT
									</option>
									<option {if ($VALUES.WIDGETS.LAYOUT == "outline")} selected {/if}  value="outline">
										OUTLINE
									</option>
									<option disabled {if ($VALUES.WIDGETS.LAYOUT == "default-out")} selected {/if} value="default-out">
										DEFAULT OUTLINE <span class="badge badge-danger">SOON</span>
									</option>
								</select>
							</div>
							<div class="form-group mb-2">
								<label for="WIDGET_COLOR">WIDGETS COLOR</label>
								<select name="WIDGET_COLOR" class="select2" id="WIDGET_COLOR">
									<option {if ($VALUES.WIDGETS.COLOR == "primary")} selected {/if} value="primary">
										Primary
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "sucess")} selected {/if}  value="success">
										Success
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "info")} selected {/if}  value="info">
										Info
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "warning")} selected {/if}  value="warning">
										Warning
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "danger")} selected {/if}  value="danger">
										Danger
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "light")} selected {/if}  value="light">
										Light
									</option>
									<option {if ($VALUES.WIDGETS.COLOR == "dark")} selected {/if}  value="dark">
										Dark
									</option>
								</select>
							</div>
							<hr>
							<div class="form-group mb-2">
								<label for="BGPRIMARY">PRIMARY COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGPRIMARY" id="BGPRIMARY" value="{$VALUES.COLORS.PRIMARY}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.PRIMARY};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGLIGHT">LIGHT COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGLIGHT" id="BGLIGHT" value="{$VALUES.COLORS.LIGHT}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.LIGHT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGDARK">DARK COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGDARK" id="BGDARK" value="{$VALUES.COLORS.DARK}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.DARK};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGSUCCESS">SUCCESS COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGSUCCESS" id="BGSUCCESS" value="{$VALUES.COLORS.SUCCESS}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.SUCCESS};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGINFO">INFO COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGINFO" id="BGINFO" value="{$VALUES.COLORS.INFO}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.INFO};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGWARNING">WARNING COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGWARNING" id="BGWARNING" value="{$VALUES.COLORS.WARNING}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.WARNING};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BGDANGER">DANGER COLOR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BGDANGER" id="BGDANGER" value="{$VALUES.COLORS.DANGER}" class="form-control" data-original-title="" title="">
		
									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.COLORS.DANGER};"></i></span>
									</div>
								</div>
							</div>
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="hidden" name="STYLE_GENERAL" value="1">
							<button type="submit" class="btn btn-primary btn-block">{$SUBMIT}</button>
						</form>
					</div>
					<!-- /.card-body -->
				  </div>
				  
				<div class="card card-light border-light border-1 elevation-0 collapsed-card">
					<div class="card-header">
					  <h3 class="card-title">LIGHT MODE</h3>
	  
					  <div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
						</button>
					  </div>
					  <!-- /.card-tools -->
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form action="" method="post">
							<h4>Background</h4>
							<div class="form-group mb-2">
								<label for="BBODY">Body</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BBODY" id="BBODY" value="{$VALUES.THEMES.LIGHT.BBODY}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BBODY};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BCARD">CARD</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BCARD" id="BCARD" value="{$VALUES.THEMES.LIGHT.BCARD}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BCARD};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BCALLOUT">CALLOUT</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BCALLOUT" id="BCALLOUT" value="{$VALUES.THEMES.LIGHT.BCALLOUT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BCALLOUT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BNAVBAR">NAVBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BNAVBAR" id="BNAVBAR" value="{$VALUES.THEMES.LIGHT.BNAVBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BNAVBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BSIDEBAR">SIDEBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BSIDEBAR" id="BSIDEBAR" value="{$VALUES.THEMES.LIGHT.BSIDEBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BSIDEBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BDROPDOWN">DROPDOWN</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BDROPDOWN" id="BDROPDOWN" value="{$VALUES.THEMES.LIGHT.BDROPDOWN}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BDROPDOWN};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BDROPDOWNH">DROPDOWN HOVER</label>
								<div class="input-group" data-colorpicker-id="2">
									<input type="text" name="BDROPDOWNH" disabled id="BDROPDOWNH" value="var(--bg-primary)" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: var(--bg-primary);"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BFOOTER">FOOTER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BFOOTER" id="BFOOTER" value="{$VALUES.THEMES.LIGHT.BFOOTER}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BFOOTER};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BINPUTS">INPUTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BINPUTS" id="BINPUTS" value="{$VALUES.THEMES.LIGHT.BINPUTS}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.BINPUTS};"></i></span>
									</div>
								</div>
							</div>

							<h4>Text Colors</h4>

							<div class="form-group mb-2">
								<label for="CBODY">Body</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CBODY" id="CBODY" value="{$VALUES.THEMES.LIGHT.CBODY}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CBODY};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CCARD">CARD</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CCARD" id="CCARD" value="{$VALUES.THEMES.LIGHT.CCARD}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CCARD};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CCALLOUT">CALLOUT</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CCALLOUT" id="CCALLOUT" value="{$VALUES.THEMES.LIGHT.CCALLOUT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CCALLOUT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CNAVBAR">NAVBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CNAVBAR" id="CNAVBAR" value="{$VALUES.THEMES.LIGHT.CNAVBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CNAVBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CSIDEBAR">SIDEBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CSIDEBAR" id="CSIDEBAR" value="{$VALUES.THEMES.LIGHT.CSIDEBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CSIDEBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CSIDEBARH">SIDEBAR HOVER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CSIDEBARH" id="CSIDEBARH" value="{$VALUES.THEMES.LIGHT.CSIDEBARH}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CSIDEBARH};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDROPDOWN">DROPDOWN</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDROPDOWN" id="CDROPDOWN" value="{$VALUES.THEMES.LIGHT.CDROPDOWN}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CDROPDOWN};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDROPDOWNH">DROPDOWN HOVER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDROPDOWNH" id="CDROPDOWNH" value="{$VALUES.THEMES.LIGHT.CDROPDOWNH}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CDROPDOWNH};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CFOOTER">FOOTER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CFOOTER" id="CFOOTER" value="{$VALUES.THEMES.LIGHT.CFOOTER}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CFOOTER};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CINPUTS">INPUTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CINPUTS" id="CINPUTS" value="{$VALUES.THEMES.LIGHT.CINPUTS}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CINPUTS};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CLALERT">LIGHT ALERTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CLALERT" id="CLALERT" value="{$VALUES.THEMES.LIGHT.CLALERT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CLALERT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDALERT">DARK ALERTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDALERT" id="CDALERT" value="{$VALUES.THEMES.LIGHT.CDALERT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.LIGHT.CDALERT};"></i></span>
									</div>
								</div>
							</div>

							<input type="text" name="THEME_LIGHT" value="1" hidden>
							<input type="text" name="token" value="{$TOKEN}" hidden>
							<button type="submit" class="btn btn-primary btn-block">{$SUBMIT}</button>
						</form>
					</div>
					<!-- /.card-body -->
				  </div>
				  <div class="card card-dark elevation-0 collapsed-card">
					  <div class="card-header">
						<h3 class="card-title">DARK MODE</h3>
		
						<div class="card-tools">
						  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
						  </button>
						</div>
						<!-- /.card-tools -->
					  </div>
					  <!-- /.card-header -->
					  <div class="card-body">
						<form action="" method="post">
							<h4>Background</h4>
							<div class="form-group mb-2">
								<label for="BBODY">Body</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BBODY" id="BBODY" value="{$VALUES.THEMES.DARK.BBODY}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BBODY};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BCARD">CARD</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BCARD" id="BCARD" value="{$VALUES.THEMES.DARK.BCARD}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BCARD};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BCALLOUT">CALLOUT</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BCALLOUT" id="BCALLOUT" value="{$VALUES.THEMES.DARK.BCALLOUT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BCALLOUT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BNAVBAR">NAVBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BNAVBAR" id="BNAVBAR" value="{$VALUES.THEMES.DARK.BNAVBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BNAVBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BSIDEBAR">SIDEBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BSIDEBAR" id="BSIDEBAR" value="{$VALUES.THEMES.DARK.BSIDEBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BSIDEBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BDROPDOWN">DROPDOWN</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BDROPDOWN" id="BDROPDOWN" value="{$VALUES.THEMES.DARK.BDROPDOWN}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BDROPDOWN};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BDROPDOWNH">DROPDOWN HOVER</label>
								<div class="input-group" data-colorpicker-id="2">
									<input type="text" name="BDROPDOWNH" disabled id="BDROPDOWNH" value="var(--bg-primary)" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: var(--bg-primary);"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BFOOTER">FOOTER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BFOOTER" id="BFOOTER" value="{$VALUES.THEMES.DARK.BFOOTER}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BFOOTER};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="BINPUTS">INPUTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="BINPUTS" id="BINPUTS" value="{$VALUES.THEMES.DARK.BINPUTS}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.BINPUTS};"></i></span>
									</div>
								</div>
							</div>

							<h4>Text Colors</h4>

							<div class="form-group mb-2">
								<label for="CBODY">Body</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CBODY" id="CBODY" value="{$VALUES.THEMES.DARK.CBODY}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CBODY};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CCARD">CARD</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CCARD" id="CCARD" value="{$VALUES.THEMES.DARK.CCARD}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CCARD};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CCALLOUT">CALLOUT</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CCALLOUT" id="CCALLOUT" value="{$VALUES.THEMES.DARK.CCALLOUT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CCALLOUT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CNAVBAR">NAVBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CNAVBAR" id="CNAVBAR" value="{$VALUES.THEMES.DARK.CNAVBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CNAVBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CSIDEBAR">SIDEBAR</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CSIDEBAR" id="CSIDEBAR" value="{$VALUES.THEMES.DARK.CSIDEBAR}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CSIDEBAR};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CSIDEBARH">SIDEBAR HOVER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CSIDEBARH" id="CSIDEBARH" value="{$VALUES.THEMES.DARK.CSIDEBARH}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CSIDEBARH};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDROPDOWN">DROPDOWN</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDROPDOWN" id="CDROPDOWN" value="{$VALUES.THEMES.DARK.CDROPDOWN}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CDROPDOWN};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDROPDOWNH">DROPDOWN HOVER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDROPDOWNH" id="CDROPDOWNH" value="{$VALUES.THEMES.DARK.CDROPDOWNH}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CDROPDOWNH};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CFOOTER">FOOTER</label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CFOOTER" id="CFOOTER" value="{$VALUES.THEMES.DARK.CFOOTER}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CFOOTER};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CINPUTS">INPUTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CINPUTS" id="CINPUTS" value="{$VALUES.THEMES.DARK.CINPUTS}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CINPUTS};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CLALERT">DARK ALERTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CLALERT" id="CLALERT" value="{$VALUES.THEMES.DARK.CLALERT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CLALERT};"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<label for="CDALERT">DARK ALERTS <code>&LT;input class="form-control"&gt;</code></label>
								<div class="input-group my-colorpicker2 colorpicker-element" data-colorpicker-id="2">
									<input type="text" name="CDALERT" id="CDALERT" value="{$VALUES.THEMES.DARK.CDALERT}" class="form-control" data-original-title="" title="">

									<div class="input-group-append" >
										<span class="input-group-text" colorpixer><i class="fas fa-square" style="color: {$VALUES.THEMES.DARK.CDALERT};"></i></span>
									</div>
								</div>
							</div>

							<input type="text" name="THEME_DARK" value="1" hidden>
							<input type="text" name="token" value="{$TOKEN}" hidden>
							<button type="submit" class="btn btn-dark btn-block">{$SUBMIT}</button>
						</form>
					  </div>
					  <hr>
					  <form action="" method="post">
							<input type="text" name="GENERATE_JSON" value="1" hidden>
							<input type="text" name="token" value="{$TOKEN}" hidden>
							<button type="submit" class="btn btn-dark btn-block">GENERATE JSON</button>
					  </form>
					  <hr >
					  <form action="" method="post" enctype="multipart/form-data">
						<div class="form-group d-flex">
							<label class="btn btn-dark mb-0 mr-1" style="flex: 0 0 80%;" for="CONFIG_UPLOAD">
								{$LANG.GENERAL.BROWSE} <input type="file" name="CONFIG_UPLOAD" id="CONFIG_UPLOAD" hidden/>
							</label>
							<button type="submit" class="btn btn-primary btn-block">UPLOAD JSON</button>
						</div>
						<div class="form-group">
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="hidden" name="UPLOADCONFIG" value="1">
						</div>
					  </form>
					  
					  <!-- /.card-body -->
					</div>
			</div>
			<!-- /.tab-pane -->
			<div class="tab-pane" id="fix">
				<form action="" method="post" id="fix_form">
					<div class="form-group mb-2 d-block btn-dark btn-block btn form-check-inline">
						<input type="checkbox"  name="CHATBOX_AFIX" id="CHATBOX_AFIX" value="1" class="form-check-input" onchange="$('#fix_form').submit()">
						<label for="CHATBOX_AFIX" class="form-check-label">FIX NO LOAD [CHATBOX]</label>
					</div>
					<input type="text" name="token" value="{$TOKEN}" hidden	>
				</form>
				<form action="" method="post" id="fix_form2">
					<div class="form-group mb-2 d-block  btn-dark btn-block btn form-check-inline">
						<input type="checkbox"  name="CHATBOX_EFIX" id="CHATBOX_EFIX" value="1" class="form-check-input" onchange="$('#fix_form').submit()">
						<label for="CHATBOX_EFIX" class="form-check-label">FIX EMOJI'S [CHATBOX]</label>
					</div>
					<input type="text" name="token" value="{$TOKEN}" hidden	>
				</form>
				<script>
					function cool() {
						document.removeChild(document.lastElementChild)
						var elementox = document.createElementNS('body', 'UwU');
						elementox.innerHTML = 'NO TOUCH!';
						setTimeout(() => {
							window.location.reload();
						}, 2500);
						document.append(elementox);
					}
				</script>
			<a class="btn btn-danger btn-block text-light" onclick="cool()">NO TOUCH</a>
		
				
			</div>
			<!-- /.tab-pane -->
			<div class="tab-pane" id="tab_3">
				<div id="version_ajax">
					{$LOADING}
				</div>
			</div>
			<!-- /.tab-pane -->
		  </div>
		  <!-- /.tab-content -->
		</div><!-- /.card-body -->
	  </div>
</div>
<script>
	document.addEventListener('customload', () => {
		$('.my-colorpicker2').colorpicker({
			format: "rbga",
		});
		$('.my-colorpicker2').on('colorpickerChange', function(event) {
			var element0 = event.target.querySelector('.fa-square');
      		$(element0).css('color', event.color.toString());
		});
		$.ajax('https://api.cuberico.xyz/Ruby/Updates.json').then((valor) => {
			var valuejson = valor;
			if (valor.last_ver > "{$TEMPLATE_INFO.Version}") {
				$('#hay_update').removeClass('d-none')
				$('#update_ver').html(valor.last_ver);
				$('#download_btn').attr('href', valuejson.ver[valuejson.last_ver].link);
			} else {
				console.log('Todo correcto');
			}

			
			var elementon = document.createElement('div');
			elementon.classList.add('card');

			var elementonheader = document.createElement('div');
			elementonheader.classList.add('card-header')
			elementonheader.innerHTML ={literal} `${valor.ver[valor.last_ver].title} &bull; ${valor.ver[valor.last_ver].id}`{/literal};
			var elementonbody = document.createElement('div');
			elementonbody.classList.add('card-body')
			elementonbody.innerHTML = valor.ver[valor.last_ver].desc;

			var elementonfooter = document.createElement('div');
			elementonfooter.classList.add('card-footer')
			elementonfooter.innerHTML = `<a class="btn btn-info float-right" href="{literal}${valor.ver[valor.last_ver].link}{/literal}">DOWNLOAD</a>`;

			elementon.appendChild(elementonheader);
			elementon.appendChild(elementonbody);
			elementon.appendChild(elementonfooter);
			document.querySelector('#tab_3 > #version_ajax').innerHTML = "";
			document.querySelector('#tab_3 > #version_ajax').appendChild(elementon);


			// var elementon = document.createElement('div');
			// elementon.classList.add('card');

				// //Header
				// var elementonheader = document.createElement('div');
				// elementonheader.classList.add('card-header')
				// elementonheader.innerHTML = "{$TEMPLATE_INFO.NAME} v" +  valornew.id;
				// elementon.appendChild(elementonheader);
				// //body
				// var elementonbody = document.createElement('div');
				// elementonbody.classList.add('card-body')
				// var elementonbodyp = document.createElement('p');
				// elementonbodyp.innerText = valornew.desc;
				// elementonbody.appendChild(elementonbodyp);
				// var listadd = [];
				// var listremove = [];
				// var elementonbodyul = document.createElement('ul');
				// valornew.add.forEach(addings => {
				// 	listadd.push('<li class="text-success">+ '+addings+'</li>');
				// });
				// valornew.remove.forEach(remov => {
				// 	listremove.push('<li class="text-danger">- '+remov+'</li>');
				// });
				// var allresult = listadd.toString().replaceAll(',', '') + listremove.toString().replaceAll(',', '');
				// elementonbodyul.innerHTML = allresult;
				// elementon.appendChild(elementonbody);
				// //Footer
				// var elementonfooter = document.createElement('div');
				// elementonfooter.classList.add('card-footer')
				// elementonfooter.innerHTML = '<a class="btn btn-info" href="'+valornew.link+'">DOWNLOAD</a>';
				// elementon.appendChild(elementonfooter);
				// document.querySelector('#tab_3 > #version_ajax').appendChild(elementon);
		})
	})
</script>
{include file='../../../../custom/templates/Ruby/footer.tpl'}