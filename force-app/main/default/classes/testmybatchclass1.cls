@istest
public class testmybatchclass1 {

 	public static testmethod void test()
    {
        //string query ='select id,name from account';
        account a = new account(name='newacc');
        insert a;
        account query = [select id,name from account where id=:a.id];
        mybatchclass1 instance = new mybatchclass1();
        test.startTest();
        database.executeBatch(instance,200);
        test.stopTest();
    }
    
}