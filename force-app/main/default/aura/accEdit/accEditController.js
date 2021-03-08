({
	handleSave : function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state==="SUCCESS" || saveResult.state==="DRAFT"){
                console.log("Save complete");
            }else{
                console.log("error "+JSON.stringify(saveResult.error));
            }
        }));
        var btnclicked = event.getSource();
        btnclicked.set("v.disabled",true);
	}
})