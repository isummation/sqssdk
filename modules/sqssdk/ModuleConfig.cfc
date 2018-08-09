/**
* Copyright Ortus Solutions, Corp
* www.ortussolutions.com
* ---
* This module connects your application to Amazon SQS
**/
component {

	// Module Properties
	this.title 				= "Amazon SQS SDK";
	this.author 			= "iSummation Technologies Pvt. Ltd.";
	this.webURL 			= "http://www.isummation.com";
	this.description 		= "This SDK will provide you with Amazon SQS connectivity for any ColdFusion (CFML) application.";
	this.version			= "@version.number@+@build.number@";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	this.autoMapModels 		= false;

	/**
	 * Configure
	 */
	function configure(){

		// Settings
		settings = {
			accessKey = "",
			secretKey = "",
			encryption_charset = "utf-8",
			ssl = false,
			defaultRegionName = "us-east-1",
			defaultServiceName = "sqs",
			signatureAlgorithm = "AWS4-HMAC-SHA256",
			hashAlorithm = "SHA256"
		};
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		parseParentSettings();
		var sqsSettings = controller.getConfigSettings().sqssdk;
		
		// Map Akismet Library
		binder.map( "aws@sqs" )
			.to( "#moduleMapping#.models.sqs" )
			.initArg( name="accessKey", 			value=sqsSettings.accessKey )
			.initArg( name="secretKey", 			value=sqsSettings.secretKey )
			.initArg( name="encryption_charset", 	value=sqsSettings.encryption_charset )
			.initArg( name="ssl", 					value=sqsSettings.ssl )
			.initArg( name="defaultRegionName", 	value=sqsSettings.defaultRegionName )
			.initArg( name="defaultServiceName", 	value=sqsSettings.defaultServiceName )
			.initArg( name="encryption_charset", 	value=sqsSettings.encryption_charset );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
	}

	/**
	* parse parent settings
	*/
	private function parseParentSettings(){
		var oConfig 		= controller.getSetting( "ColdBoxConfig" );
		var configStruct 	= controller.getConfigSettings();
		var sqsDSL 			= oConfig.getPropertyMixin( "sqssdk", "variables", structnew() );
		
		//defaults
		configStruct.sqssdk = variables.settings;

		// incorporate settings
		structAppend( configStruct.sqssdk, sqsDSL, true );
	}

}
