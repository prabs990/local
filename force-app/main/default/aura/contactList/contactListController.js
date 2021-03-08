({
	doInit : function(component, event, helper) {
        component.set("v.columns",[
            {label:'Contact Name',fieldName:'Name',type:'text'},
            {label:'Phone',fieldName:'Phone',type:'phone'},
            {label:'Email',fieldName:'Email',type:'email'}
        ]);
        
        var action = component.get('c.getContactList');
        action.setCallback(this,$A.getCallback(function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                component.set('v.mydata',response.getReturnValue());
            }
        }));
        $A.enqueueAction(action);
	}
})