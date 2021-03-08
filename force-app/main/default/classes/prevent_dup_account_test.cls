@istest
public class prevent_dup_account_test {
	
    public static testmethod void test_prevent_dup_account()
    {
         String errmsg='duplicate account';
         Account a1 = new Account(name='shja');
         insert a1; 
         Account a2 = new Account(name='ivota23');		
         insert a2; 
		 System.assertEquals('duplicate account', errmsg); 
         try
         {
             insert a2;
         }
        catch(exception e)
        {
            system.debug('This means the trigger is working');
        }
 
    }

}