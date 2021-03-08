public class contact_service{

    public static void calculate(List<Contact> conlist){
    Set<Id> accId = new Set<Id>(); 
    List<Account> acc = new List<Account>();
    
    for(contact c: conlist){
            accId.add(c.accountId);     
        }
    
    
    for(Account a : [select id, (select id from contacts) from account where Id in :accId]){
        a.numberOfcontact1__c = a.contacts.size();
        acc.add(a);
    }
    update acc;
    }
}