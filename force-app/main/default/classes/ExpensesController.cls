public with sharing class ExpensesController {
	@AuraEnabled
    public static List<Expense__c> getExpenses(){
        return [select id,name,amount__c,Client__c,reimbursed__c,createdDate from expense__c];
    }
    @AuraEnabled
    public static Expense__c saveExpense(Expense__C expense){
        system.debug('Inside database. Expense attribute is'+expense);
        upsert expense;
        system.debug('Inside database after update. Expense attribute is'+expense);
        return expense;
    }
}