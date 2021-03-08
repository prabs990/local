public class accountsWithContactsClass {
@auraEnabled
    public static list<account> getAllAccounts(){
        list<account> accs =[select id,name,phone,industry,(select lastname from contacts) from account limit 10];
        return accs;
    }
}