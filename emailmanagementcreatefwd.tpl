{include file="$template/pageheader.tpl" title=$LANG.rcmail_createonlyfwd desc=$domain}

<p>{$LANG.rcmail_createforwarderdesc1}@{$domain} {$LANG.rcmail_createforwarderdesc2}@{$domain}</p>

{if $mailfwdcreateerror}
<br />
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$mailfwdcreateerror}
    </ul>
</div>
{/if}

{if $mailfwdcreatesuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$mailfwdcreatesuccess}
    </ul>
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=createmailfwd">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<input type="hidden" name="createmailfwd" value="true"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter" style="vertical-align:top">
				{$LANG.rcmail_ifmailarrives}
			</td>
			<td class="textcenter" style="vertical-align:top">
				<input name="mailalias" type="text" value="{if $mailfwdcreateerror}{$smarty.post.mailalias}{/if}" size="30"/>
				<strong>@{$domain}</strong>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_redirectto}</strong>
			</td>
			<td>
				{$LANG.rcmail_inputredirectto}<br />
				<textarea class="fullwidth" name="forwardto" cols="50" rows="7">{if $mailfwdcreateerror}{$smarty.post.forwardto}{/if}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_note}:</strong>
			</td>
			<td>
				{$LANG.rcmail_maxforwarderdesc}
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_createonlyfwd}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managemailhosting">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>