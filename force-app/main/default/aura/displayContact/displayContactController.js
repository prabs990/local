({
	doinit : function(component, event, helper) {
		console.log("record id is "+component.get("v.recordId"));
        var localId = component.get("v.recordId");
        console.log("localId  "+localId);
        var action = component.get("c.getdisplayRecords");
        
        action.setParams({accountIdLocal :localId});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state==="SUCCESS"){
                console.log("ans "+response.getReturnValue());
                component.set("v.contactList",response.getReturnValue());
            }else if (state==="Incomplete"){
                console.log("incomeple");
            }else if(state==="ERROR"){
                var errors = response.getError();
                if(errors){
                    console.log("Error message: " + errors[0].message);
                }
            }
        });
         $A.enqueueAction(action);
	}
})