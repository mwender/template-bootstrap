<div class="page-header">
	<h1>{$LANG.login}</h1>
</div>

<div class="row">
	<div class="col-md-6 col-md-offset-3">
{if $incorrect}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.loginincorrect}
		</div>
{/if}
		<form method="post" action="{$systemsslurl}dologin.php" name="frmlogin">
			<fieldset>
				<div class="form-group">
					<label for="username">{$LANG.loginemail}:</label>
					<input class="form-control" name="username" id="username" type="text">
				</div>
				<div class="form-group">
					<label for="password">{$LANG.loginpassword}:</label>
					<input class="form-control" name="password" id="password" type="password">
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox"{if $rememberme} checked="checked"{/if}> {$LANG.loginrememberme}
					</label>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="{$LANG.loginbutton}">
				</div>
			</fieldset>
		</form>
		<p class="text-center">
			<a href="pwreset.php">{$LANG.loginforgotteninstructions}</a>
		</p>
	</div>
</div>
