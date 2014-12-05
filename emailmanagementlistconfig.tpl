{include file="$template/pageheader.tpl" title=$LANG.rcmail_configmailinglisttitle desc=$domain}

{literal}
<script language="javascript" type="text/javascript">function cleanField(){if( document.cfg.replytomail.value!="")document.cfg.replytomail.value=""}</script>{/literal}

<h3>{$LANG.rcmail_configlisttitle} {$xmlmailinglist.mailingList.listname}@{$xmlmailinglist.mailingList.domainname}</h3>

<p>{$LANG.rcmail_configlistdesc}:</p>

<ul>
	<li>
		<strong>{$LANG.rcmail_listquestion1}</strong> = {$LANG.rcmail_listanswer1}
	</li>
	<li>
		<strong>{$LANG.rcmail_listquestion2}</strong> = {$LANG.rcmail_listanswer2}
	</li>
	<li>
		<strong>{$LANG.rcmail_listquestion3}</strong> = {$LANG.rcmail_listanswer3}
	</li>
	<li>
		<strong>{$LANG.rcmail_listquestion4}</strong> = {$LANG.rcmail_listanswer4}
	</li>
</ul>

<p>{$LANG.rcmail_listotherconfdesc1} <a href="supporttickets.php">{$LANG.rcmail_clickherelink}</a> {$LANG.rcmail_listotherconfdesc2}</p>

{if $configlistsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$configlistsuccess}
    </ul>
</div>
{/if}

{if $configlisterror}
<br />
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$configlisterror}
    </ul>
</div>
{/if}

<form method="post" name="cfg" action="{$smarty.server.PHP_SELF}?action=configmailinglist">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="configlist" value="true"/>
	<input type="hidden" name="listaddress" value="{$xmlmailinglist.mailingList.listname}@{$xmlmailinglist.mailingList.domainname}"/>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="2">
					<strong><h3>{$LANG.rcmail_configmaillisttitle}</h3> </strong>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<strong>{$LANG.rcmail_listconfigis}</strong>
				</td>
				<td>
					<ul>
						<li>
							{if $xmlmailinglist.mailingList.subscriptionHeld eq false}{$LANG.rcmail_listtypeopen}{else}{$LANG.rcmail_listtypeclosed}{/if}
						</li>
						<li>
							{if $xmlmailinglist.mailingList.whoCanPost eq "ANYONE"}{$LANG.rcmail_anyonepost}{elseif $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MEMBERS"}{$LANG.rcmail_membersonlypost}{elseif $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MODERATORS"}{$LANG.rcmail_moderatorsonlypost}{/if}
						</li>
						<li>
							{if $xmlmailinglist.mailingList.messagesHeldForModeration eq false}{$LANG.rcmail_messagecontrolno}{else}{$LANG.rcmail_messagecontrolyes}{/if}
						</li>
						<li>
							{if $xmlmailinglist.mailingList.replyToAddress eq "SENDER"}{$LANG.rcmail_responsetosender}
							{elseif $xmlmailinglist.mailingList.replyToAddress eq "ENTIRE_LIST"}{$LANG.rcmail_responsetomembers}
							{else}{$LANG.rcmail_responsetoemail} {$xmlmailinglist.mailingList.replyToAddress}
							{/if}
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<strong>{$LANG.rcmail_listquestion1}</strong>
				</td>
				<td>
					<input name="subscriptionheld" value="false" {if $xmlmailinglist.mailingList.subscriptionHeld eq "false" || empty($xmlmailinglist.mailingList.subscriptionHeld)}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer11}<br />
					<input name="subscriptionheld" value="true" {if $xmlmailinglist.mailingList.subscriptionHeld eq "true"}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer1}
				</td>
			</tr>
			<tr>
				<td>
					<strong>{$LANG.rcmail_listquestion2}</strong>
				</td>
				<td>
					<input name="whocanpost" value="anyone" {if $xmlmailinglist.mailingList.whoCanPost eq "ANYONE" || empty($xmlmailinglist.mailingList.whoCanPost)}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer22}<br />
					<input name="whocanpost" value="only_members" {if $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MEMBERS"}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer222}<br/>
					<input name="whocanpost" value="only_moderators" {if $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MODERATORS"}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer2}
				</td>
			</tr>
			<tr>
				<td>
					<strong>{$LANG.rcmail_listquestion3}</strong>
				</td>
				<td>
					<input name="moderation" value="false" {if $xmlmailinglist.mailingList.messagesHeldForModeration eq "false" || empty($xmlmailinglist.mailingList.messagesHeldForModeration)}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer333}<br />
					<input name="moderation" value="true" {if $xmlmailinglist.mailingList.messagesHeldForModeration eq "true"}checked="checked"{/if} type="radio"> 
					{$LANG.rcmail_listanswer33}
				</td>
			</tr>
			<tr>
				<td>
					<strong>{$LANG.rcmail_listquestion4}</strong>
				</td>
				<td>
					<input name="replyto" value="sender" {if $xmlmailinglist.mailingList.replyToAddress == "SENDER" || empty($xmlmailinglist.mailingList.replyToAddress)}checked="checked"{/if} type="radio" onclick="return cleanField();"> 
					{$LANG.rcmail_listanswer44} <br />
					<input name="replyto" value="entire_list" {if $xmlmailinglist.mailingList.replyToAddress == "ENTIRE_LIST"}checked="checked"{/if} type="radio" onclick="return cleanField();"> 
					{$LANG.rcmail_listanswer444} <br />
					{if $xmlmailinglist.mailingList.replyToAddress == "ENTIRE_LIST"}
					<input name="replyto" value="custom_address" type="radio"> 
					{$LANG.rcmail_listanswer4}:
					<input name="replytomail" value="" size="25"/>
					{elseif $xmlmailinglist.mailingList.replyToAddress == "SENDER"}
					<input name="replyto" value="custom_address" type="radio"> 
					{$LANG.rcmail_listanswer4}:
					<input name="replytomail" value="" size="25"/>
					{else}
					<input name="replyto" type="radio" value="custom_address" checked="checked"> 
					{$LANG.rcmail_listanswer4}:
					<input name="replytomail" value="{$xmlmailinglist.mailingList.replyToAddress}" size="25"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p align="center"><input type="submit" value="{$LANG.rcmail_applychangesbutton}" class="btn btn-success"/></p>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managelists">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>