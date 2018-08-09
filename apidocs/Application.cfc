component{

	this.name = "APIDocs" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,1,0);

	// API Root
	API_ROOT = getDirectoryFromPath( getCurrentTemplatePath() );
	rootPath = REReplaceNoCase( API_ROOT, "apidocs(\\|\/)$", "" );

	this.mappings[ "/docbox" ]  		= API_ROOT & "docbox";
	this.mappings[ "/root" ] 			= rootPath;
	this.mappings[ "/coldbox" ]  		= rootPath & "coldbox";
	this.mappings[ "/cbi18n" ] 			= rootPath & "modules/cbi18n/models";

}