@isTest
public class prac1_test {

    public static testmethod void testone()
    {
        Account a = new Account(name='first');
        insert a;
        try{
        	Account a1 = new Account(name='first');
        	insert a1;    
        }
        catch(DMLexception e)
        {
            System.debug('Entered exception'+e.getMessage());
        }
    }
}