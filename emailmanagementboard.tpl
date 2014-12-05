{include file="$template/pageheader.tpl" title=$LANG.rcmail_managemailboxus desc=$domain}

{if $language == "spanish"}
{literal}<script language="javascript" type="text/javascript">function confirmDelete(){return confirm("De verdad desea desactivar definitivamente la cuenta atrapalotodo?");}</script>{/literal}
{else}
{literal}<script language="javascript" type="text/javascript">function confirmDelete(){return confirm("You really want deactivate the catchall account?");}</script>{/literal}
{/if}

{if $freemailnotavailable}
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$freemailnotavailable}
    </ul>
</div>
{/if}

{if !$freemailnotavailable}

{if $freemailhosting == "true"}
<h3>{$LANG.rcmail_limitedservice} {$LANG.rcmail_managemailboxus}: {$domain}</h3>
{/if}

{if $nschangeerror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$nschangeerror}
    </ul>
</div>
{/if}

{if $nschangesuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$nschangesuccess}
    </ul>
</div>
{/if}

{if $deactivatecatchallsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$deactivatecatchallsuccess}
    </ul>
</div>
{/if}

{if $nsserversok != 1}
{literal}<script language="javascript" type="text/javascript">function showdnscheckform(){jQuery("#dnscheck").slideToggle();}</script>{/literal}

<div class="alert alert-warning">
	{$LANG.rcmail_domdnsconfigerror1}&nbsp;<a href="#" onclick="showdnscheckform();return false;">{$LANG.rcmail_clickherelink}</a><br />
</div>
<div style="display:none;" id="dnscheck">
	<br />
	<h3>
		{$LANG.rcmail_nameservertitle}
	</h3>
	<p>
		{$LANG.rcmail_mailhostingdnssolutiontitle}
	</p>
	<ul>
		<li>
			{$LANG.rcmail_newmailhostingsolution1}
		</li>
		<li>
			{$LANG.rcmail_newmailhostingsolution2}
		</li>
	</ul>
	<p>
		<strong>{$LANG.rcmail_note}:</strong> {$LANG.rcmail_dnsconfigapplied}
	</p>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="2">
					{$LANG.rcmail_newmailhostingsolution1}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="50%" style="vertical-align:top">
					<p class="label terminated">
						{$LANG.rcmail_currentnameservers}
					</p>
					{foreach key=num item=actualdns from=$configurednsservers.0}
					{$actualdns}<br />
					{/foreach}
				</td>
				<td width="50%" style="vertical-align:top">
					<p class="label active">
						{$LANG.rcmail_recommendednameservers}
					</p>
					{foreach key=num item=defaultdns from=$requirednsservers.0}
					{$defaultdns}<br />
					{/foreach}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
						<input name="domainid" value="{$domainid}" type="hidden"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
						{foreach key=num item=defaultdns from=$requirednsservers.0}
						<input type="hidden" name="ns[]" value="{$defaultdns}"/>
						{/foreach}
						<input type="hidden" name="changens" value="true"/>
						<p align="center"><input type="submit" {if $nsserversok == 1}disabled="disabled"{/if} value="{$LANG.rcmail_changednsbutton}" class="btn btn-success"/></p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<br/><br/>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="4">
					{$LANG.rcmail_newmailhostingsolution2}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4">
				<h3>{$LANG.rcmail_mxrecordtitle}</h3>
				</td>
			</tr>
			<tr>
				<td>
					<strong><u>{$LANG.rcmail_recordpriority}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordhostdomain}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordmx}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordttl}</u></strong>
				</td>
			</tr>
			{foreach key=num item=service from=$mxrecords}
			<tr>
				<td>
					{$service.priority}
				</td>
				<td>
					{$domain}
				</td>
				<td>
					{$service.value}
				</td>
				<td>
					86400 {$LANG.rcmail_recordseconds}
				</td>
			</tr>
			{foreachelse}
			<tr>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="3">
					<h3>{$LANG.rcmail_cnamerecordtitle}</h3>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<strong><u>{$LANG.rcmail_recordalias}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordhostdomain}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordttl}</u></strong>
				</td>
			</tr>
			{foreach key=num item=service from=$cnamerecords}
			<tr>
				<td>
					{$service.aliasHost}
				</td>
				<td>
					{$service.canonicalHost}
				</td>
				<td>
					86400 {$LANG.rcmail_recordseconds}
				</td>
			</tr>
			{foreachelse}
			<tr>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
				<td>
					{$LANG.rcmail_dnsrecsnotavailableyet}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="3">
					<h3>{$LANG.rcmail_txtrecordtitle}</h3>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<strong><u>{$LANG.rcmail_recordname}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordvalue}</u></strong>
				</td>
				<td>
					<strong><u>{$LANG.rcmail_recordttl}</u></strong>
				</td>
			</tr>
			<tr>
				<td>
					<div style="width: 250px; word-wrap: break-word;">
						{if !empty($dkimrecords.domainname)}{$dkimrecords.domainname}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
					</div>
				</td>
				<td>
					<div style="width: 250px; word-wrap: break-word;">
						{if !empty($dkimrecords.value)}{$dkimrecords.value}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
					</div>
				</td>
				<td>
					{if !empty($dkimrecords.value)}86400 {$LANG.rcmail_recordseconds}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
				</td>
			</tr>
			<tr>
				<td>
					<div style="width: 250px; word-wrap: break-word;">
						{if !empty($spfrecords.domainname)}{$spfrecords.domainname}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
					</div>
				</td>
				<td>
					<div style="width: 250px; word-wrap: break-word;">
						{if !empty($spfrecords.value)}{$spfrecords.value}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
					</div>
				</td>
				<td>
					{if !empty($spfrecords.value)}86400 {$LANG.rcmail_recordseconds}{else}{$LANG.rcmail_dnsrecsnotavailableyet}{/if}
				</td>
			</tr>
		</tbody>
	</table>
</div>
{/if}

<br/>

<table class="table table-striped table-framed">
	<thead>
		<tr>
			<th>
				{$LANG.clientareastatus}
			</th>
			<th colspan="2">
				{if $ownershipverify eq "true"}
				<span class="label active">
					{$LANG.clientareaactive}
				</span>
				{else}
				<span class="label terminated">
					{$LANG.rcmail_newpendingdnsconf}
				</span>
				{/if}
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<strong>{$LANG.rcmail_domainname}</strong>
			</td>
			<td colspan="2">
				{$domain}
			</td>
		</tr>
		<tr>
			<td>
				<strong>Webmail URL</strong>
			</td>
			<td colspan="2">
				<a href="http://webmail.{$domain}" target="_blank">http://webmail.{$domain}</a>
			</td>
		</tr>
		{if $isstargate neq "true"}
		<tr>
			<td>
				<strong>{$LANG.rcmail_catchallacctitle}</strong>
			</td>
			<td>
				{if $iscatchallactive eq "true"}
				<form method="POST" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
					<input name="deactivatecatchall" value="true" type="hidden"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="submit" value="{if $iscatchallactive eq "true"}{$LANG.rcmail_deactivatetitle}{/if}" onclick="return confirmDelete();" class="btn btn-danger"/>
					{if $iscatchallactive eq "true"}{$LANG.rcmail_catchallassocmail}: 
					<span class="label active">
						<strong>{$catchallmailaccount}</strong>
					</span>
					{/if}
				</form>
				{else}
				<form method="post" action="{$smarty.server.PHP_SELF}?action=catchall">
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_activatetitle}" class="btn btn-success"/>
					<span class="label expired">
						{$LANG.rcmail_toactivatecatchalldo}
					</span>
				</form>
				{/if}
			</td>
		</tr>
		{/if}
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmails}</strong>
			</td>
			<td colspan="2">
				{if $numproducts}<strong>{$numproducts}</strong>{else}{$LANG.rcmail_infonotavail}{/if}
			</td>
		</tr>
		{if $isstargate neq "true"}
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmailswithoutresponder}</strong>
			</td>
			<td colspan="2">
				{if $numpopaccounts}<strong>{$numpopaccounts}</strong>&nbsp;<a href="{$smarty.server.PHP_SELF}?action=manageemails&amp;q=without_autoresponder&amp;domainid={$domainid}&amp;domain={$domain}&amp;freemailhosting={$freemailhosting}&amp;page=1">{$LANG.clientareaviewdetails}</a>{else}{$LANG.rcmail_infonotavail}{/if}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmailswithresponder}</strong>
			</td>
			<td colspan="2">
				{if $numpoprespondaccounts}<strong>{$numpoprespondaccounts}</strong>&nbsp;<a href="{$smarty.server.PHP_SELF}?action=manageemails&amp;q=with_autoresponder&amp;domainid={$domainid}&amp;domain={$domain}&amp;freemailhosting={$freemailhosting}&amp;page=1">{$LANG.clientareaviewdetails}</a>{else}{$LANG.rcmail_infonotavail}{/if}
			</td>
		</tr>
		{/if}
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmailsonlyfwd}</strong>
			</td>
			<td colspan="2">
				{if $numfwdaccounts}<strong>{$numfwdaccounts}</strong>&nbsp;<a href="{$smarty.server.PHP_SELF}?action=manageemails&q=forward&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&amp;page=1">{$LANG.clientareaviewdetails}</a>{else}{$LANG.rcmail_infonotavail}{/if}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmailssuspended}</strong>
			</td>
			<td colspan="2">
				{if $numsuspendedaccounts}<strong>{$numsuspendedaccounts}</strong>&nbsp;<a href="{$smarty.server.PHP_SELF}?action=manageemails&q=suspend&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&amp;page=1">{$LANG.clientareaviewdetails}</a>{else}{$LANG.rcmail_infonotavail}{/if}
			</td>
		</tr>
		{if $freemailhosting eq "false"}
		<tr>
			<td>
				<strong>{$LANG.rcmail_totalmailinglists}</strong>
			</td>
			<td colspan="2">{if $nummailinglist}<strong>{$nummailinglist}</strong>{else}{$LANG.rcmail_infonotavail}{/if}</td>
		</tr>
		{/if}
	</tbody>
</table>

<br/>

<table class="table table-striped table-framed">
	<thead>
		<tr>
			{if $isstargate neq "true"}
			<th class="textcenter">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=createaccount">
					<input type="hidden" name="page" value="1"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_createemail}" class="btn btn-info"/>
				</form>
			</th>
			{/if}
			<th class="textcenter">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=createmailfwd">
					<input type="hidden" name="page" value="1"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_createonlyfwd}" class="btn btn-info"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=manageemails">
					<input type="hidden" name="page" value="1"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_manageemailaccounts}" class="btn btn-info"/>
				</form>
			</th>
			{if $freemailhosting eq "false"}
			<th class="textcenter">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=createmaillist">
					<input type="hidden" name="page" value="1"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_createemaillist}" class="btn btn-info"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=managelists">
					<input type="hidden" name="page" value="1"/>
					<input name="domainid" value="{$domainid}" type="hidden"/>
					<input name="domain" value="{$domain}" type="hidden"/>
					<input type="submit" value="{$LANG.rcmail_manageemaillists}" class="btn btn-info"/>
				</form>
			</th>
			{/if}
		</tr>
	</thead>
</table>

{/if}

<br />

<form method="post" action="clientarea.php?action={if empty($freemailhosting) || $freemailhosting eq "false"}productdetails{else}domaindetails{/if}">
	<input type="hidden" name="id" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>