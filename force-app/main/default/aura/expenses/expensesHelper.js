({
    createExpense: function(component, expense) {
        this.saveExpense(component, expense, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
        });
    },
        
    updateExpense: function(component, expense) {
        console.log('before update expense is'+JSON.stringify(expense));
		this.saveExpense(component,expense);
        console.log('after update expense is'+JSON.stringify(expense));
    },
    
    saveExpense: function(component,expense,callback){
        console.log('before save method'+JSON.stringify(expense));
        var action = component.get("c.saveExpense");
        action.setParams({"expense":expense});
        if(callback){
            action.setCallback(this,callback);
        }
        $A.enqueueAction(action);
    }

})