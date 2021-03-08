({
	handleComponentEvent : function(component, event, helper) {
		var message = event.getParam("message");
        component.set("v.messageFromevent",message);
        var numEventhandle = parseInt(component.get("v.numEvent")) + 1;
        component.set("v.numEvent",numEventhandle);
	}
})