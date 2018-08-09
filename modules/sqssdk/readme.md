# Welcome to the Amazon SQS SDK

This SDK is ColdBox module which allows you to add Amazon SQS capabilities to your ColdFusion (CFML) applications 

## Resources

* SQS API Reference: https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/Welcome.html

## Installation 
For now you can download sqssdk folder and place into modules folder of your coldbox Application.


Then follow either the standalone or module instructions below.

### Standalone

This SDK will be installed into a directory called `sqssdk` and then the SDK can be instantiated via ` new sqssdk.models.sqs()` with the following constructor arguments:

```
<cfargument name="accessKey" 			required="true">
<cfargument name="secretKey" 			required="true">
<cfargument name="encryption_charset" 	required="false" default="utf-8">
<cfargument name="ssl" 					required="false" default="false">
<cfargument name="defaultRegionName		required="false" default="us-east-1">
<cfargument name="defaultServiceName 	required="false" default="sqs">
<cfargument name="signatureAlgorithm 	required="false" default="AWS4-HMAC-SHA256">
<cfargument name="hashAlorithm 			required="false" default="SHA256"
```

### ColdBox Module

This package also is a ColdBox module as well.  The module can be configured by creating an `sqssdk` configuration structure in your application configuration file: `config/Coldbox.cfc` with the following settings:

```
sqssdk = {
	// Your amazon access key
	accessKey = "",
	// Your amazon secret key
	secretKey = "",
	// The default encryption character set
	encryption_charset = "utf-8",
	// SSL mode or not on cfhttp calls.
	ssl = false
	defaultRegionName = "us-east-1",
	defaultServiceName = "sqs",
	signatureAlgorithm = "AWS4-HMAC-SHA256",
	hashAlorithm = "SHA256"
};
```

Then you can leverage the SDK CFC via the injection DSL: `aws@sqs`

## Usage

Please check out the included API Docs to see all the methods available to you using our sqs SDK.