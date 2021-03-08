({
	clickcreate : function(component, event, helper) {
        var validExpense = component.find('expenseform').reduce(function(validSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        
        if(validExpense){
            var newExpense = component.get("v.newExpense");
            console.log("Create Expense Form" + JSON.stringify(newExpense));
            helper.createExpense(component,newExpense);
        }
	}
})