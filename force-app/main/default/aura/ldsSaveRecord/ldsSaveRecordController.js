({
	handleSaveRecord : function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state==="SUCCESS" || saveResult.state==="DRAFT"){
                console.log("Save completed");
            }else if(saveResult.state==="INCOMPLETE"){
                console.log("user is offline, device doesnt support draft");
            }else if(saveResult.state==="ERROR"){
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
	},
})