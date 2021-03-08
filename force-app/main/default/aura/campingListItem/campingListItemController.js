({
	packItem : function(component, event, helper) {
		
        var a = component.get("v.item",true);
        a.Packed__c=true;
        a.name="item1";
 	    a.Quantity__c=10;
   	    a.Price__c=20;
		component.set("v.item",a);
        var btnclicked = event.getSource();
        btnclicked.set("v.disabled",true);
		
    }
})