{include file="$template/pageheader.tpl" title=$LANG.rcmail_createemaillist desc=$domain}

{literal}<script language="javascript" type="text/javascript">function cleanField(){if(document.cfg.replytomail.value!="")document.cfg.replytomail.value=""}</script>{/literal}

<p>{$LANG.rcmail_createnewlistdesc}:</p>

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

{if $createlistsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$createlistsuccess}
    </ul>
</div>

<br />

<table class="table table-bordered table-hover">
	<tr>
		<td>
			<strong>{$LANG.rcmail_maillistemailtitle}</strong>			
		</td>
		<td colspan="2">
			{$xmlmailinglist.mailingList.listname}@{$xmlmailinglist.mailingList.domainname}			
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_moderatorsemailtitle}</strong>			
		</td>
		<td colspan="2">
			{$moderators}			
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_listmailtype}</strong>			
		</td>
		<td colspan="2">
			{if $xmlmailinglist.mailingList.subscriptionHeld eq false}{$LANG.rcmail_listtypeopen}{else}{$LANG.rcmail_listtypeclosed}{/if}
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_listmailsendtitle}</strong>			
		</td>
		<td colspan="2">
			{if $xmlmailinglist.mailingList.whoCanPost eq "ANYONE"}{$LANG.rcmail_anyonepost}
			{elseif $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MEMBERS"}{$LANG.rcmail_membersonlypost}
			{elseif $xmlmailinglist.mailingList.whoCanPost eq "ONLY_MODERATORS"}{$LANG.rcmail_moderatorsonlypost}{/if}
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_listcontroltitle}</strong>
		</td>
		<td colspan="2">
			{if $xmlmailinglist.mailingList.messagesHeldForModeration eq false}{$LANG.rcmail_messagecontrolno}{else}{$LANG.rcmail_messagecontrolyes}{/if}
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_listanswertitle}</strong>			
		</td>
		<td colspan="2">
			{if $xmlmailinglist.mailingList.replyToAddress eq "SENDER"}{$LANG.rcmail_responsetosender}
			{elseif $xmlmailinglist.mailingList.replyToAddress eq "ENTIRE_LIST"}{$LANG.rcmail_responsetomembers}
			{else}{$LANG.rcmail_responsetoemail}{$xmlmailinglist.mailingList.replyToAddress}{/if}
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_subscriptionmailaddress}</strong>
		</td>
		<td colspan="2">
			{$xmlmailinglist.mailingList.listname}-subscribe@{$domain}
		</td>
	</tr>
	<tr>
		<td>
			<strong>{$LANG.rcmail_unsubscriptionmailaddress}</strong>
		</td>
		<td colspan="2">
			{$xmlmailinglist.mailingList.listname}-unsubscribe@{$domain}
		</td>
	</tr>
	<tr>
		<td>
			<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="submit" value="{$LANG.clientareabacklink}" class="btn"/>
			</form>
		</td>
		<td>
			<form method="POST" action="{$smarty.server.PHP_SELF}?action=configmailinglist">
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="listaddress" value="{$xmlmailinglist.mailingList.listname}@{$xmlmailinglist.mailingList.domainname}"/>
				<input type="submit" value="{$LANG.rcmail_configlistbutton}" class="btn btn-info"/>
			</form>
		</td>
	    <td>
			<form method="POST" action="{$smarty.server.PHP_SELF}?action=managelist">
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="listaddress" value="{$xmlmailinglist.mailingList.listname}@{$xmlmailinglist.mailingList.domainname}"/>
				<input type="submit" value="{$LANG.rcmail_managemembersmoderadorsbutton}" class="btn btn-info"/>
			</form>
		</td>
	</tr>
</table>

<br/>

{/if}

{if $createlisterror}
<br />
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$createlisterror}
    </ul>
</div>
{/if}

<form method="post" name="cfg" action="{$smarty.server.PHP_SELF}?action=createmaillist">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="createlist" value="true"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td colspan="2">
				<h3>{$LANG.rcmail_createnewlisttitle}</h3>			
			</td>
		</tr>
		<tr>
			<td>
				{$LANG.rcmail_listaliastitle}
			</td>
			<td>
				<input name="listalias" value="{if $createlisterror}{$smarty.post.listalias}{/if}" size="40"/>&nbsp;<strong>@{$domain}</strong>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_moderatorsemailtitle}</strong>
			</td>
			 <td>
				{$LANG.rcmail_listmoderatordesc} {$LANG.rcmail_listmoderatormaxdesc}: <strong>5</strong>
				<p><strong>{$LANG.rcmail_note}:</strong> {$LANG.rcmail_listmoderatormaildesc}</p>
				<textarea class="fullwidth" name="moderators" cols="40" rows="4">{if $createlisterror}{$smarty.post.moderators}{/if}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_listquestion1}</strong>
			</td>
			<td>
				<input name="subscriptionheld" value="false" checked="checked" type="radio">&nbsp;{$LANG.rcmail_listanswer11}<br/>
				<input name="subscriptionheld" value="true" type="radio">&nbsp;{$LANG.rcmail_listanswer1}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_listquestion2}</strong>
			</td>
			<td>
				<input name="whocanpost" value="anyone" checked="checked" type="radio">&nbsp;{$LANG.rcmail_listanswer22}<br/>
				<input name="whocanpost" value="only_members" type="radio">&nbsp;{$LANG.rcmail_listanswer222}<br/>
				<input name="whocanpost" value="only_moderators" type="radio">&nbsp;{$LANG.rcmail_listanswer2}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_listquestion3}</strong>
			</td>
			<td>
				<input name="moderation" value="false" checked="checked" type="radio">&nbsp;{$LANG.rcmail_listanswer333}<br/>
				<input name="moderation" value="true" type="radio">&nbsp;{$LANG.rcmail_listanswer33}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_listquestion4}</strong>
			</td>
			<td>
				<input name="replyto" value="sender" checked="checked" type="radio" onclick="return cleanField();">&nbsp;{$LANG.rcmail_listanswer44} <br/>
				<input name="replyto" value="entire_list" type="radio" onclick="return cleanField();">&nbsp;{$LANG.rcmail_listanswer444} <br/>
				<input name="replyto" value="custom_address" type="radio">&nbsp;{$LANG.rcmail_listanswer4}:&nbsp;&nbsp;<input name="replytomail" value="{if $createlisterror}{$smarty.post.replytomail}{/if}" size="25"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_createnewlistbutton}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>