@isTest
public class account_updt_test {

    public static testmethod void account_updt()
    {
        Account act = new Account(name='jiva');
        Insert act;
        Account act1=[select id,hello__c from account where id = :act.Id];
        System.assertEquals('world', act1.hello__c);
    }
}