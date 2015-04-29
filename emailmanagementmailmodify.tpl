{if $language == "spanish"}
{literal}<script language="javascript" type="text/javascript">function confirmFwdDelete(){return confirm("De verdad desea borrar definitivamente el Destinatario?");}</script>{/literal}
{else}
{literal}<script language="javascript" type="text/javascript">function confirmFwdDelete(){return confirm("You really want permanently delete the recipient?");}</script>{/literal}
{/if}

{if $isonlyforwarder}
{include file="$template/pageheader.tpl" title=$LANG.rcmail_modifyforwardertitle desc=$emailaddress}

<p>{$LANG.rcmail_modifyforwarderdesc1} <strong>{$emailaddress}</strong> {$LANG.rcmail_modifyforwarderdesc2}</p>

{if $delforwarderror}
<br />
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$delforwarderror}
    </ul>
</div>
{/if}

{if $delforwardsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$delforwardsuccess}
    </ul>
</div>
{/if}

{if $addforwarderror}
<br />
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$addforwarderror}
    </ul>
</div>
{/if}

{if $addforwardsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addforwardsuccess}
    </ul>
</div>
{/if}

<div class="widget-header widget-header-flat">
	<h4 class="lighter">{$LANG.rcmail_forwarderactualtitle}</h4>
</div>

<table class="table table-bordered table-hover">
	<tr>
		<td>
			<table width="100%" style="border:none;">
				{foreach key=num item=forwarder from=$adminForwards}
				{if $singleforward}
				<tr>
					<td style="border:none;">
						{$LANG.rcmail_mailssendto}: <span class="label expired">{$emailaddress}</span>&nbsp;{$LANG.rcmail_forwardingto}: <span class="label label-active">{$forwarder}</span>							
					</td>
				</tr>
				{else}
				<tr>
					<td style="border:none;">
						{$LANG.rcmail_mailssendto}: <span class="label expired">{$emailaddress}</span>&nbsp;{$LANG.rcmail_forwardingto}: <span class="label label-active">{$forwarder}</span><br />
					</td>
					<td style="border:none;">
						<form method="post" action="{$smarty.server.PHP_SELF}?action=modifyaccount">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<input type="hidden" name="delforwarder" value="true"/>
							<input type="hidden" name="mailtype" value="onlyforwarder"/>
							<input type="hidden" name="forwarder" value="{$forwarder}"/>
							<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
							<input type="submit" value="{$LANG.cartremove}" onclick="return confirmFwdDelete();" class="btn btn-danger"/>
						</form>
					</td>
				</tr>
				{/if}
				{/foreach}
			</table>
		</td>
	</tr>
</table>

<br  />

<form method="post" action="{$smarty.server.PHP_SELF}?action=modifyaccount">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
	<input type="hidden" name="addforwarder" value="true"/>
	<input type="hidden" name="mailtype" value="onlyforwarder"/>
	<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
	<div class="widget-header widget-header-flat">
		<h4 class="lighter">{$LANG.rcmail_inputredirectto}</h4>
	</div>	
	<table class="table table-bordered table-hover">
		<tr>
			<td width="200">
				<strong>{$LANG.rcmail_redirectto}:</strong>
			</td>
			<td>
				<textarea class="fullwidth" name="forwardto" cols="100" rows="5">{if $addforwardererror}{$smarty.post.forwardto}{/if}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_note}:</strong>
			</td>
			<td>
				{$LANG.rcmail_undeleteableforwarderdesc}
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_addforwardbutton}" class="btn btn-success"/></p>
			</td>
		</tr>
</table>
</form>

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=manageemails">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
	<p style="text-align:center;"><input type="submit" value="{$LANG.clientareabacklink}"/ class="btn"></p>
</form>

{/if}
{if $ismailaccount}

{include file="$template/pageheader.tpl" title=$LANG.rcmail_modifyemail desc=$emailaddress}

<p>{$LANG.rcmail_modifyemailaccountdesc}</p>

<div class="tabbable" id="tabs">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#tab1">{$LANG.rcmail_modifypersonaldata}</a></li>
		<li><a data-toggle="tab" href="#tab2">{$LANG.rcmail_changepasswdtitle}</a></li>
		<li><a data-toggle="tab" href="#tab3">{$LANG.rcmail_resetmailpasswdtitle}</a></li>
    </ul>

	<div class="tab-content">
		<div id="tab1" class="tab-pane active">
			<div class="row">
				<div class="col-sm-4">
					<div class="internalpadding">
						<div class="styled_title"><h2>{$LANG.rcmail_modifypersonaldata}</h2></div>
						<form method="post" action="{$smarty.server.PHP_SELF}?action=manageemails">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<p style="text-align:left;"><input type="submit" value="{$LANG.clientareabacklink}"/ class="btn"></p>
						</form>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="internalpadding">
						{if $modifyaccounterror}
						<br />
						<div class="alert alert-danger">
							<p class="bold">{$LANG.clientareaerrors}</p>
							<ul>
								{$modifyaccounterror}
							</ul>
						</div>
						{/if}
						
						{if $modifyaccountsuccess}
						<br />
						<div class="alert alert-success">
							<p class="bold">{$LANG.moduleactionsuccess}</p>
							<ul>
								{$modifyaccountsuccess}
							</ul>
						</div>
						{/if}			
						<form method="post" action="{$smarty.server.PHP_SELF}?action=modifyaccount#tab2">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<input type="hidden" name="mailtype" value="mailaccount"/>
							<input type="hidden" name="userdetails" value="true"/>
							<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
							<div class="widget-header widget-header-flat">
								<h4 class="lighter">{$LANG.rcmail_modifypersonaldata}</h4>
							</div>						
							<table class="table table-bordered table-hover">
								<tr>
									<td width="200">
										<strong>{$LANG.clientareafirstname}</strong>
									</td>
									<td>
										<input name="firstname" type="text" value="{if $firstName}{$firstName}{else}{$smarty.post.firstname}{/if}" size="20"/>
									</td>
								</tr>
								<tr>
									<td>
										<strong>{$LANG.clientarealastname}</strong>
									</td>
									<td>
										<input name="lastname" type="text" value="{if $lastName}{$lastName}{else}{$smarty.post.lastname}{/if}" size="20"/>
									</td>
								</tr>
								<tr>
									<td>
										<strong>{$LANG.rcmail_emailaccounttitle}</strong>
									</td>
									<td>
										<input name="noname" type="text" value="{$emailaddress}" disabled="disabled" size="40"/>
									</td>
								</tr>
								<tr>
									<td>
										<strong>{$LANG.rcmail_alternatemailaddress}</strong>
									</td>
									<td>
										<input name="notifymail" type="text" value="{if alternatemailaddr}{$alternatemailaddr}{else}{$smarty.post.alternatemailaddr}{/if}" size="40"/><br/><strong>{$LANG.rcmail_importantnotetitle}</strong>: {$LANG.rcmail_importantnotedesc}
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<p align="center"><input type="submit" value="{$LANG.rcmail_applychangesbutton}"/ class="btn btn-success"></p>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div id="tab2" class="tab-pane">
			<div class="row">
				<div class="col-sm-4">
					<div class="internalpadding">
						<div class="styled_title"><h2>{$LANG.rcmail_changepasswdtitle}</h2></div>
						<form method="post" action="{$smarty.server.PHP_SELF}?action=manageemails">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<p style="text-align:left;"><input type="submit" value="{$LANG.clientareabacklink}"/ class="btn"></p>
						</form>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="internalpadding">
						{if $changepasswderror}
						<br />
						<div class="alert alert-danger">
							<p class="bold">{$LANG.clientareaerrors}</p>
							<ul>
								{$changepasswderror}
							</ul>
						</div>
						{/if}
						
						{if $changepasswdsuccess}
						<br />
						<div class="alert alert-success">
							<p class="bold">{$LANG.moduleactionsuccess}</p>
							<ul>
								{$changepasswdsuccess}
							</ul>
						</div>
						{/if}
						
						<form method="post" action="{$smarty.server.PHP_SELF}?action=modifyaccount#tab3">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<input type="hidden" name="mailtype" value="mailaccount"/>
							<input type="hidden" name="changepasswd" value="true"/>
							<input type="hidden" name="emailaddress" value="{$emailaddress}"/>					
							<table class="table table-bordered table-hover">
								{if $changepasswdsuccess}
								<tr>
									<td colspan="2">
										<div class="alert alert-warning">
											<strong>{$LANG.rcmail_yournewpasswdis}:</strong>&nbsp;&nbsp;{$smarty.post.newmailpassword}<br />
										</div>
									</td>
								</tr>
								{/if}
								<tr>
									<td width="200" style="vertical-align:top">
										{$LANG.rcmail_youroldpasswd}
									</td>
									<td style="vertical-align:top">
										<input name="oldmailpassword" type="text" value="{if $changepasswderror}{$smarty.post.oldmailpassword}{/if}" size="20"/>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:top">
										{$LANG.rcmail_yournewpasswd}
									</td>
									<td style="vertical-align:top">
										<input name="newmailpassword" type="text" value="{if $changepasswderror}{$smarty.post.newmailpassword}{/if}" size="20"/>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<p align="center"><input type="submit" value="{$LANG.rcmail_changepassword}" class="btn btn-success"/></p>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div id="tab3" class="tab-pane">
			<div class="row">
				<div class="col-sm-4">
					<div class="internalpadding">
						<div class="styled_title"><h2>{$LANG.rcmail_resetmailpasswdtitle}</h2></div>
						<form method="post" action="{$smarty.server.PHP_SELF}?action=manageemails">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<p style="text-align:left;"><input type="submit" value="{$LANG.clientareabacklink}"/ class="btn"></p>
						</form>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="internalpadding">
						{if $resetpasswderror}
						<br />
						<div class="alert alert-danger">
							<p class="bold">{$LANG.clientareaerrors}</p>
							<ul>
								{$resetpasswderror}
							</ul>
						</div>
						{/if}
						
						{if $resetpasswdsuccess}
						<br />
						<div class="alert alert-success">
							<p class="bold">{$LANG.moduleactionsuccess}</p>
							<ul>
								{$resetpasswdsuccess}
							</ul>
						</div>
						{/if}
						
						<form method="post" action="{$smarty.server.PHP_SELF}?action=modifyaccount#tab4">
							<input type="hidden" name="page" value="{$smarty.post.page}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
							<input type="hidden" name="mailtype" value="mailaccount"/>
							<input type="hidden" name="resetpasswd" value="true"/>
							<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
							<table class="table table-bordered table-hover">
								<tr>
									<td colspan="2">
										{if $resetpasswdsuccess}
										<div class="alert alert-warning">
											{$LANG.rcmail_yournewpasswdis}:&nbsp;&nbsp;{$resetpasswdoutput}<br />
										</div>
										{else}					
										<div align="center">{$LANG.rcmail_resetmailpasswddesc}</div>
										{/if}
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<p align="center"><input type="submit" value="{$LANG.rcmail_resetmailpasswdbutton}" class="btn btn-success"/></p>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<br />

{/if}