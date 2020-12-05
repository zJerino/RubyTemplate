{assign var="MEMBER_PANEL" value="1"}
{include file='header.tpl'}

<div class="card card-outline card-outline-primary card-primary">
    <div class="card-body">
	  <div class="table-responsive">
      <table class="table table-striped dataTables-users" id="membertable">
            <thead class="ni-asd">
                <tr>
                    <th>{$USERNAME}</th>
                    <th>{$GROUP}</th>
                    <th>{$CREATED}</th>
                </tr>
            </thead>
            <tbody class="ni-asd">
                {foreach from=$MEMBERS item=member}
                  <tr>
                    <td><a href="{$member.profile}"><img src="{$member.avatar}" class="img-circle" style="height:35px; width:35px;" alt="{$member.nickname}" /></a> <a style="color:{$member.group_colour};" href="{$member.profile}">{$member.nickname}</a></td>
                    <td>{$member.group}</td>
                    <td>{$member.joined}</td>
                  </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

{include file='footer.tpl'}