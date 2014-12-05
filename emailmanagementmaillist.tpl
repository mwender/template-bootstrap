{include file="$template/pageheader.tpl" title=$LANG.rcmail_managemailinglisttitle desc=$domain}

{if $language == "spanish"}
{literal}<script language="javascript" type="text/javascript">function confirmMemberDelete(){return confirm("De verdad desea borrar definitivamente este Miembro de la Lista?");}function confirmModeratorDelete(){return confirm("De verdad desea borrar definitivamente este Moderador de la Lista?");}</script>{/literal}
{else}
{literal}<script language="javascript" type="text/javascript">function confirmMemberDelete(){return confirm("You really want permanently delete the Member from the Mailing List?");}function confirmModeratorDelete(){return confirm("You really want permanently delete the Moderator from the Mailing List?");}</script>{/literal}
{/if}
{literal}<script language="javascript" type="text/javascript">function showmemform(){jQuery("#memfrm").slideToggle();}function showmodform(){jQuery("#modfrm").slideToggle();}</script>{/literal}

{if $addsubscribersuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addsubscribersuccess}
    </ul>
</div>
{/if}

{if $addsubscribererror}
<br />
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$addsubscribererror}
    </ul>
</div>
{/if}

{if $delsubscribersuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$delsubscribersuccess}
    </ul>
</div>
{/if}

{if $delsubscribererror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$delsubscribererror}
    </ul>
</div>
{/if}

{if $addmoderatorsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addmoderatorsuccess}
    </ul>
</div>
{/if}

{if $addmoderatorerror}
<br />
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$addmoderatorerror}
    </ul>
</div>
{/if}

{if $delmoderatorsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$delmoderatorsuccess}
    </ul>
</div>
{/if}

<div class="searchbox">
    <form method="post" action="{$smarty.server.PHP_SELF}?action=managelist">
		<div class="input-append">
        <input type="text" name="q" value="{if $q}{$q}{else}{$LANG.rcmail_searchentercriteria}{/if}" class="input-medium appendedInputButton" onfocus="if(this.value=='{$LANG.rcmail_searchentercriteria}')this.value=''" />
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input type="hidden" name="listaddress" value="{$listaddress}"/>
        <input type="submit" value="{$LANG.searchfilter}" class="btn btn-success" />
		</div>
    </form>
</div>

<br />

<p>{$numproducts} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<br />
{literal}<script language="javascript" type="text/javascript">function toggleChecked(status){jQuery(".checkbox").each(function(){jQuery(this).attr("checked",status);})}</script>{/literal}

<div>
	<a href="" onclick="showmemform();return false;"><strong>{$LANG.rcmail_createmembertitle}</strong></a>
	&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="" onclick="showmodform();return false;"><strong>{$LANG.rcmail_createdeletemoderators}</strong></a>
</div>

<div id="modfrm" style="display:{if $addmoderatorsuccess || $addmoderatorerror || $delmoderatorsuccess}block{else}none{/if};">
	<br />
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th colspan="2">
					<h3>{$LANG.rcmail_addmoderators} ({$LANG.rcmail_moderatorstitle})</h3>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					{if $moderatorslist.1}
					{foreach key=num item=moderator from=$moderatorslist}
					<form method="post" action="{$smarty.server.PHP_SELF}?action=managelist">
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input type="hidden" name="deletemoderator" value="true"/>
						<input type="hidden" name="moderator" value="{$moderator}"/>
						<input type="hidden" name="listaddress" value="{$listaddress}"/>
						<div>
							<span style="float:left;"><strong>{$moderator}</strong>&nbsp;&nbsp;</span>
							<span style="float:right;"><input type="submit" value="{$LANG.cartremove}" onclick="return confirmModeratorDelete();" class="btn btn-danger"/></span><br /><br />
						</div>
						<br />
					</form>
					{/foreach}
					{else}
					{$moderatorslist.0}
					{/if}
				</td>
			</tr>
		</tbody>
	</table>
	<br />
	<form method="post" action="{$smarty.server.PHP_SELF}?action=managelist">
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input type="hidden" name="addmoderator" value="true"/>
		<input type="hidden" name="listaddress" value="{$listaddress}"/>
		<table class="table table-striped table-framed">
			<thead>
				<tr>
					<th width="200">
						{$LANG.rcmail_moderatorstitle} Emails
					</th>
					<th>
						{$LANG.rcmail_moderatorsdesc}<br/>
						<textarea class="fullwidth" name="moderators" cols="50" rows="5">{if $addmoderatorerror}{$smarty.post.moderators}{/if}</textarea>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<strong>{$LANG.rcmail_note}</strong>
					</td>
					<td>
						{$LANG.rcmail_undeleteablemoddesc}
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p align="center"><input type="submit" value="{$LANG.rcmail_addmoderatorbutton}" class="btn btn-success"/></p>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<br />

<div id="memfrm" style="display:{if $addsubscribersuccess || $addsubscribererror}block{else}none{/if};">
	<br />
	<form method="post" action="{$smarty.server.PHP_SELF}?action=managelist">
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input type="hidden" name="addsubscriber" value="true"/>
		<input type="hidden" name="listaddress" value="{$listaddress}"/>
		<table class="table table-striped table-framed">
			<thead>
				<tr>
					<th colspan="2">
						<h3>{$LANG.rcmail_addmembers}</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<strong>Emails</strong>
					</td>
					 <td>
						{$LANG.rcmail_membersdesc} <br />
						<textarea class="fullwidth" name="subscribers" cols="50" rows="5">{if $addsubscribererror}{$smarty.post.subscribers}{/if}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<strong>{$LANG.rcmail_note}</strong>
					</td>
					<td>
						{$LANG.rcmail_maxmembersaddatonce}<br />
						{$LANG.rcmail_maxmembersdesc}
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p align="center"><input type="submit" value="{$LANG.rcmail_addmemberbutton}" class="btn btn-success"/></p>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<br />

<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th {if $orderby eq "subscriber"} class="headerSort{$sort}"{/if}><a href="{$smarty.server.PHP_SELF}?action=managelist{if $q}&q={$q}{/if}&listaddress={$listaddress}&orderby=subscriber&domainid={$domainid}&domain={$domain}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_listmembertitle}&nbsp;{$LANG.rcmail_singlewordof} {$listaddress}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcmail_mailactions}</a></th>
		    <th><input type="checkbox" onclick="toggleChecked(this.checked)"></th>
        </tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td>
				{$service.subscriber}
			</td>
			<td>
				<form method="POST" action="{$smarty.server.PHP_SELF}?action=managelist" onclick="return confirmMemberDelete();">
					<input type="hidden" name="deletesubscriber" value="true"/>
					<input type="hidden" name="subscribers" value="{$service.subscriber}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="listaddress" value="{$listaddress}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcmail_deletebutton}" class="btn btn-danger"/>
				</form>
			</td>
		    <td><input name="multiaction[]" type="checkbox" value="{$service.subscriber}" class="checkbox"/></td>
		</tr>
		{foreachelse}
		<tr>
			<td colspan="3">
				{$LANG.norecordsfound}			
			</td>
		</tr>
		{/foreach}
		<tr>
			<td colspan="2">
				{if $searchdataKey}
				<div style="float:right;">
					<form id="multiaction" method="POST" action="{$smarty.server.PHP_SELF}?action=managelist">
						<input type="hidden" name="domain" value="{$domain}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="listaddress" value="{$listaddress}"/>
						<input type="hidden" name="page" value="{$pagenumber}"/>
						<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
						<input type="hidden" name="q" value="{$q}"/>
						<input type="submit" name="membersdelete" value="{$LANG.rcmail_multideletememberbutton}" class="btn btn-danger" onclick="return confirmMemberDelete();" />
					</form>
				</div>
				{/if}
				{if $q neq ""}
				<div style="float:left;">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=managelist">
					<input type="hidden" name="q" value=""/> 
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="listaddress" value="{$listaddress}"/>
					<p align="center"><input type="submit" value="{$LANG.rcmail_deletesearchquerybutton}" class="btn"/></p>
				</form>
				</div>
				{/if}			
			</td>
		    <td>{if $searchdataKey}<input type="checkbox" onclick="toggleChecked(this.checked)">{/if}</td>
		</tr>
	</tbody>
</table>

<br/>
{literal}<script language="javascript" type="text/javascript">jQuery('#multiaction').on('submit',function(e){$form=jQuery(this);jQuery('input[type=checkbox]:checked').each(function(index,elem){var val=jQuery(elem).val(),name=jQuery(elem).attr('name');var hiddenInput=jQuery('<input type="hidden" value="'+val+'" name="'+name+'"/>');$form.append(hiddenInput);});});</script>{/literal}

<div class="recordslimit">
	<form action="{$smarty.server.PHP_SELF}">
		<input type="hidden" name="action" value="managelist" />
		<select name="itemlimit" id="itemlimit" onchange="this.form.submit();">
			<option>{$LANG.resultsperpage}</option>
			<option value="10"{if $itemlimit==10} selected{/if}>10</option>
			<option value="25"{if $itemlimit==25} selected{/if}>25</option>
			<option value="50"{if $itemlimit==50} selected{/if}>50</option>
			<option value="100"{if $itemlimit==100} selected{/if}>100</option>
			<option value="all"{if $itemlimit > 100} selected{/if}>{$LANG.clientareaunlimited}</option>
		</select>
		<input type="hidden" name="domainid" value="{$domainid}" />
		<input type="hidden" name="domain" value="{$domain}" />
		<input type="hidden" name="listaddress" value="{$listaddress}" />
	</form>
</div>

<div class="pagination">
    <ul>
        <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}{$smarty.server.PHP_SELF}?action=managelist{if $q}&q={$q}{/if}&amp;page={$prevpage}&domainid={$domainid}&domain={$domain}&listaddress={$listaddress}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
        <li class="next{if !$nextpage || $nextpage==$pageend} disabled{/if}"><a href="{if $nextpage != $pageend}{$smarty.server.PHP_SELF}?action=managelist{if $q}&q={$q}{/if}&amp;page={$nextpage}&domainid={$domainid}&domain={$domain}&listaddress={$listaddress}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
    </ul>
</div>

<br  />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managelists">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>