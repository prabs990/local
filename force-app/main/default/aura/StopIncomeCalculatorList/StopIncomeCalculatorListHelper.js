({
	fetchData : function(component,event,helper) {
		var action = component.get("c.getData");
        
        action.setCallback(this,function(response){
        	var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.data",response.getReturnValue());
                console.log('response.getReturnValue()==='+response.getReturnValue());
            }else{
                console.log('error '+ state);
            }    
        });
        $A.enqueueAction(action);
	}
})