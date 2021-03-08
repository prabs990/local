({
	fireComponentEvent : function(component, event, helper) {
		console.log('before event');
        var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "message" : "A event has been fired from notifier"
        });
        console.log('after event');
        cmpEvent.fire();
	}
})