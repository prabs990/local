({
	packItem : function(component, event, helper) {
		var items = component.get("v.item");
        console.log("items "+items);
        items.name="item1";
        items.packed__c=true;
        component.set("v.item",items);
        var btnclicked = event.getSource();
        btnclicked.set("v.disabled",true);
	}
})