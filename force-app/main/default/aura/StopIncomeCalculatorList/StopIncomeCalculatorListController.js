({
	doinit : function(component, event, helper) {
        console.log('init of stopincomecalculatorlistcontroller');
		component.set('v.columns',[
            {label : 'Select', fieldName: 'Select', type:'text'},
            {label : 'Expense name', fieldName: 'Name', type: 'text'},
            {label : 'Amount', fieldName:'Amount__c', type:'number'}
        ]);
        helper.fetchData(component,event,helper);
	},
    updateSelectedText: function(component,event){
        var selectedRows = event.getParam('selectedRows');
        component.set('v.selectedRowsCount',selectedRows.length);
    },
    handleEvent: function(component,event,helper){
        console.log('event reached');
        var updatedExp = event.getParam("expenseEvent"); 
        var expenses = component.get("v.data");
        expenses.push(updatedExp);
        component.set("v.data",expenses);
    }
})