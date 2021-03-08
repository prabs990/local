({
	handleclick : function(component, event, helper) {
        console.log('1');
		var cmpEvent = component.getEvent('sampleCmpEvent'); 
        console.log('2');
        alert('component9');
        cmpEvent.fire();
        console.log('3');
        
        
	}
})