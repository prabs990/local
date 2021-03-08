@istest
public class hello_world_trigger_test {

    public static testmethod void test()
    {
    	account a1 = new account(name='check');
    	insert a1;
        account a3=[select id,name,hello__c from account where id = :a1.id];
        system.assertEquals('world',a3.hello__c , 'looks good');
        account a2 = new account(name='ch',hello__c='thellotext');
        insert a2;
        
        
    }
}