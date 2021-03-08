@istest
public class no_of_contacts_test {

    public static testmethod void test1()
    {
        Account a = new Account(name='test acc1',numberofcontact__c=2);
        insert a;
        Account a1=[select id,name,numberofcontact__c from Account where id=:a.id];
        system.assertEquals(2, a1.numberofcontact__c);
    }
        
}