({
/*	clickCreateItem : function(component, event, helper) {
		    
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validCamping){
            // Create the new expense
       
            var newCamping = component.get("v.newItem");
            console.log('new Camping'+ JSON.stringify(newCamping));
            helper.createItem(component, newCamping); 
            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                          'Name':'',
                          'Price__c':0,
                          'Quantity__c':0,
                          'Packed__c' :false
                          });
        }
	},
*/    
    handleAddItem:function(component,event,helper){
      var newItem = event.getParam("item");
      var action= component.get("c.saveItem ");
        action.setParams({"item":newItem});
/**/        
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
/**/        
        
    },
    doInit: function(component, event, helper){
//Create an action
		var action = component.get("c.getItems");
//Add Callback behaviour when response is received
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.items",response.getReturnValue());
                
                console.log("return values are"+JSON.stringify(response.getReturnValue()));
            }
            else{
                console.log("Failed with state"+state);
            }
            
        });
        $A.enqueueAction(action);
	},
})