({
	clickCreateItem : function(component, event, helper) {
        var validItem = component.find('expenseform').reduce(function(validSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        if(validItem){
            var newItem = component.get("v.newItem");
            var items = component.get("v.items");
            var theItem = JSON.parse(JSON.stringify(newItem));
            items.push(theItem);
            component.set("v.items",items);
            component.set("v.newItem","");
        }
	}
})