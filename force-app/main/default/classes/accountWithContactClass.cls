public class accountWithContactClass {

    @auraEnabled
    public static List<Account> getAllAccounts(){
        List<Account> accs = [select id,name,industry,(select name from contacts) from account];
        return accs;
    }
}