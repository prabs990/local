({
	handleClick : function(component, event, helper) {
		var Btnclicked = event.getSource();
        console.log("Btnclicked==="+Btnclicked);
        var btnMessage = Btnclicked.get("v.label");
        console.log("btnMessage==="+btnMessage);
        component.set("v.message",btnMessage);
	},
    handleClick1 : function(component, event, helper){
        var btnmessage = event.getSource().get("v.label");
        component.set("v.message",btnmessage);
    }
})