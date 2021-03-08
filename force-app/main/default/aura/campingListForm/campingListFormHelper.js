({
	createItem : function(component, item) {
		
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({"item":item});
        createEvent.fire();
        component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                          'Name':'',
                          'Price__c':0,
                          'Quantity__c':0,
                          'Packed__c' :false
                          });
        
/*        console.log('helper item is ' +JSON.stringify(item));
		var action = component.get("c.saveItem");
        action.setParams({"item":item});
        
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log("before success method");
            if(state==="SUCCESS"){
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items",items);
            }
            else{
                console.log("error state is"+state);
            }
            
        });
        $A.enqueueAction(action);
*/        
	},
})