({
	clickCreateItem : function(component, event, helper) {
		    
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
/*            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                          'Name':'',
                          'Price__c':0,
                          'Quantity__c':0,
                          'Packed__c' :false
                          });
*/                          

        }
	},
})