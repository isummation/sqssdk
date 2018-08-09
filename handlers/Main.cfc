/**
* My Event Handler Hint
*/
component{

	// Index
	any function index( event,rc, prc ){
		event.renderData( type="text", data="Setup Done");
	}

	// Run on first init
	any function onAppInit( event, rc, prc ){

	}
	// Account id can be find in SQS Url
	any function sendMessage( event, rc, prc ){
		var oSQL = getInstance("aws@sqs" );
		var res = oSQL.sendMessage(
			accountid = "111122223333",
			queuename = "test",
			messageBody = "test",
			DelaySeconds = 0
		);
		event.renderData( type="xml", data=res);
	}
	
	any function receiveMessage( event, rc, prc ){
		var oSQL = getInstance("aws@sqs" );
		var res = oSQL.receiveMessage(
			accountid = "111122223333",
			queuename = "test"
		);
		event.renderData( type="xml", data=res);
	}
}