{include file="$template/pageheader.tpl" title=$LANG.rcmail_catchallacctitle desc=$domain}

<p>{$LANG.rcmail_catchallactivatedesc}</p>

<br />

{if $catchallerror}
<br />
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$catchallerror}
    </ul>
</div>
{/if}

{if $catchallsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$catchallsuccess}&nbsp;{$smarty.post.selectascatchall}
    </ul>
</div>
{/if}

{if !$popaccounts}
<br />
<div class="alert alert-warn">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$LANG.rcmail_createmailfirst}
    </ul>
</div>

{else}

<form method="post" action="{$smarty.server.PHP_SELF}?action=catchall">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<input type="hidden" name="setcatchallaccount" value="true"/>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" style="vertical-align:top">
					{$LANG.rcmail_catchalluseas}
				</th>
				<th class="textcenter" style="vertical-align:top">
					<select name="selectascatchall">
						{foreach from=$popaccounts item=mailaddress}
						<option value="{$mailaddress}">{$mailaddress}</option>
						{/foreach}
					</select>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">
					<p align="center"><input type="submit" value="{$LANG.rcmail_catchallcreatebutton}" class="btn btn-success"/></p>
				</td>
			</tr>
		</tbody>
	</table>
</form>
{/if}

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
<input type="hidden" name="domainid" value="{$domainid}"/>
<input type="hidden" name="domain" value="{$domain}"/>
<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>