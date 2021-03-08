public class AccountClass {

    public  static void InsertAccount(List<Account> acts){
        system.debug('acts===='+acts);
        for(Account a : acts)
        {
            if(a.hello__c!='world')
            {
                a.hello__c='world';
            }
        }
    }
}