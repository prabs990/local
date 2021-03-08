({
	handleClick : function(component, event, helper) {
		var recordId = component.get("v.recordId");
        var url='/apex/inlineedit?parentId='+recordId;
        window.open(url,'_blank');
  		console.log('event03');
/*        var pageReference = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__travellerContact01',
            },
            state: {
                "c__eventId": "000000000012"
            }
        };
        component.set("v.pageReference", pageReference);        
        
        var navService = component.find("navService");
        var pageReference = component.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageReference);        
        console.log('event04');*/
	},
	handleClick01 : function(component, event, helper) {
		var recordId = component.get("v.recordId");
        var url='/apex/inlineedit01?parentId='+recordId;
        window.open(url,'_blank');
	}    
})