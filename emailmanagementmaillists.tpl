{include file="$template/pageheader.tpl" title=$LANG.rcmail_allmailingliststitle desc=$domain}

{if $language == "spanish"}
{literal}<script language="javascript" type="text/javascript">function confirmDelete(){return confirm("De verdad desea borrar definitivamente la Lista de Email?");}</script>{/literal}
{else}
{literal}<script language="javascript" type="text/javascript">function confirmDelete(){return confirm("You really want permanently delete the Mailing List?");}</script>{/literal}
{/if}

{if $listdeletedsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$listdeletedsuccess}
    </ul>
</div>
{/if}

<div class="searchbox">
    <form method="post" action="{$smarty.server.PHP_SELF}?action=managelists">
		<div class="input-append">
        <input type="text" name="q" value="{if $q}{$q}{else}{$LANG.rcmail_searchentercriteria}{/if}" class="input-medium appendedInputButton" onfocus="if(this.value=='{$LANG.rcmail_searchentercriteria}')this.value=''" />
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
        <input type="submit" value="{$LANG.searchfilter}" class="btn btn-success" />
		</div>
    </form>
</div>

<br />

<p>{$numproducts} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<br />

<table class="table table-bordered table-hover">
       <tr>
		<td {if $orderby eq "listname"} class="headerSort{$sort}"{/if}><a href="{$smarty.server.PHP_SELF}?action=managelists{if $q}&q={$q}{/if}&orderby=listname&domainid={$domainid}&domain={$domain}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_maillisttitle}</a></td>
		<td {if $orderby eq "subscribers"} class="headerSort{$sort}"{/if}><a href="{$smarty.server.PHP_SELF}?action=managelists{if $q}&q={$q}{/if}&orderby=subscribers&domainid={$domainid}&domain={$domain}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_numsubscriberstitle}</a></td>
		<td {if $orderby eq "moderators"} class="headerSort{$sort}"{/if}><a href="{$smarty.server.PHP_SELF}?action=managelists{if $q}&q={$q}{/if}&orderby=moderators&domainid={$domainid}&domain={$domain}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_nummoderatorstitle}</a></td>
		<td colspan="3"><a href="#" onclick="return false">{$LANG.rcmail_mailactions}</a></td>
	</tr>
	{foreach key=num item=service from=$searchdataKey}
	<tr>
		<td>
			<div style="width:180px;word-wrap:break-word;">{$service.listname}@{$service.domainname}</div>
		</td>
		<td>
			{$service.subscribers}
		</td>
		<td>
			{$service.moderators}
		</td>
		<td>
			<form method="POST" action="{$smarty.server.PHP_SELF}?action=configmailinglist">
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="listaddress" value="{$service.listname}@{$service.domainname}"/>
				<input type="submit" value="{$LANG.rcmail_configurebutton}" class="btn btn-info"/>
			</form>
		</td>
		<td>
			<form method="POST" action="{$smarty.server.PHP_SELF}?action=managelist">
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="listaddress" value="{$service.listname}@{$service.domainname}"/>
				<input type="submit" value="{$LANG.rcmail_managemembersmoderadorsbutton}" class="btn btn-info"/>
			</form>
		</td>
		<td>
			<form method="POST" action="{$smarty.server.PHP_SELF}?action=managelists" onclick="return confirmDelete();">
				<input type="hidden" name="delete" value="true"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="listname" value="{$service.listname}"/>
				<input type="hidden" name="page" value="{$pagenumber}"/>
				<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
				<input type="hidden" name="q" value="{$q}"/>
				<input type="submit" value="{$LANG.rcmail_deletebutton}" class="btn btn-danger"/>
			</form>
		</td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="7">
			{$LANG.norecordsfound}
		</td>
	</tr>
	{/foreach}
	{if $q neq ""}
	<tr>
		<td colspan="7">
			<form method="post" action="{$smarty.server.PHP_SELF}?action=managelists">
				<input type="hidden" name="q" value=""/> 
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="submit" value="{$LANG.rcmail_deletesearchquerybutton}" class="btn"/>
			</form>
		</td>
	</tr>
	{/if}
</table>

<br/>

<div class="recordslimit">
	<form action="{$smarty.server.PHP_SELF}">
		<input type="hidden" name="action" value="managelists" />
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
	</form>
</div>

<div class="pagination">
    <ul>
        <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}{$smarty.server.PHP_SELF}?action=managelists{if $q}&q={$q}{/if}&amp;page={$prevpage}&domainid={$domainid}&domain={$domain}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
        <li class="next{if !$nextpage || $nextpage==$pageend} disabled{/if}"><a href="{if $nextpage != $pageend}{$smarty.server.PHP_SELF}?action=managelists{if $q}&q={$q}{/if}&amp;page={$nextpage}&domainid={$domainid}&domain={$domain}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
    </ul>
</div>

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>