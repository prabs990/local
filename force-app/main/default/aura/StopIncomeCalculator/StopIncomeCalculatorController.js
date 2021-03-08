({
	addIncome : function(component, event, helper) {
		var action = component.get("c.saveExpense");
        action.setParams({"expense":component.get("v.expense")});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                console.log('success insert');
            }else{
                console.log('error'+state);
            }
        });
        $A.enqueueAction(action);
        
        console.log('firing event');
        var expense = component.get("v.expense");
     //   var updateEvent = component.getEvent("updateExpense");
        var updateEvent = $A.get("e.c:StopIncomeEvent");
        updateEvent.setParams({"expenseEvent":expense});
        updateEvent.fire();
        console.log('event fired');
        component.set("v.expense","");
	},
    showhide : function(component,event,helper){
        /*var showHide = document.getElementById('displaycmp');
        console.log('showhide'+showHide);
        console.log('showHide.style.display'+showHide.style.display);
        if(showHide.style.display==='none'){
            showHide.style.display='block';
        }else{
            showHide.style.display='none';
        }*/
        var toggleText = component.find("displaycmp");
        $A.util.toggleClass(toggleText,"toggle");
    }
})