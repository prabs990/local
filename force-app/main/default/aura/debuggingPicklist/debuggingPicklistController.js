({
	doInit : function(component, event, helper) {
        var levelList = component.get("v.levelList");
        console.log('levelList'+levelList);
        component.set("v.levelList",['alpha','beta','gamma']);
        levelList = component.get("v.levelList");
        var action = component.get("c.levelValue");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.SSvariable",response.getReturnValue());
                console.log('success');
            }
        });
        $A.enqueueAction(action);
	},
    selectedValue : function(component, event, helper){
        var level = component.get("v.contactInput.Level__c");
        alert('level is'+level);
    },
    searchClicked : function(component, event, helper){
        
    }
})