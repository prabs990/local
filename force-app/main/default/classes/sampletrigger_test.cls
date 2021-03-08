@istest
public class sampletrigger_test {
	
    public static testmethod void test()
    {
        Account a = new Account(name='alpha');
        insert a;
        account a1=[select id,name from account where id=:a.id];
        system.assertEquals('ivota', a1.name, 'display message');
    }
}