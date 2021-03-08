({
	myAction : function(component, event, helper) {
		var action=component.get("c.getAllAccounts");
        console.log('the action value is =='+action);
        action.setCallback(this,function(a) {
            component.set("v.accounts",a.getReturnValue());
            console.log("the accs are==="+JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action);
	}
})