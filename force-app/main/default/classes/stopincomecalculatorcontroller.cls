public class stopincomecalculatorcontroller {

    @AuraEnabled
    public static List<Expense__c> getData(){
        return [select id,name,amount__c from Expense__c];
    }
    @AuraEnabled
    public static String saveExpense(Expense__c expense){
        try{
        	insert expense;    
            return 'Successful';
        }
        catch(exception e){
            return e.getMessage();
        }
        
    }
}