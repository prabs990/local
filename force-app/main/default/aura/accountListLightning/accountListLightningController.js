({
    handleNext : function(component, event, helper) {
        
        var data = event.getParams('testMessage');
        console.log('data is'+data);
    },
    handlePrevious : function(component,event,helper){
        
        var data = event.getParams('testMessage');
        console.log('data is'+data);
    }
})