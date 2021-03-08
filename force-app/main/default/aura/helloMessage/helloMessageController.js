({
    handleClick : function(component, event, helper) {
        var buttonClicked = event.getSource();
        var btnMessage= buttonClicked.get('v.label');
        component.set("v.message",btnMessage);
    },
    
    handleClick2 : function(component, event, helper) {
    	var buttonClicked = event.getSource().get("v.label");
   		component.set("v.message",buttonClicked);
	}
 })