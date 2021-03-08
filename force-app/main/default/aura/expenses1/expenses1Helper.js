({
	createExpense : function(component,expense) {
		 var theExpenses = component.get("v.expenses");
        console.log('JSON.stringify(expense)'+JSON.stringify(expense));
        console.log('JSON.parse(JSON.stringify(expense))'+JSON.parse(JSON.stringify(expense)));
        var newExpense = JSON.parse(JSON.stringify(expense));
        theExpenses.push(newExpense);
        component.set("v.expenses",theExpenses);
        console.log("expenses are "+JSON.stringify(theExpenses));
	}
})