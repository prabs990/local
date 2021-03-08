@isTest
public class batch_class_sample1_test {

    public static testMethod void test()
    {
        Account a = new Account(name='try1');
        insert a;
        Batch_Class_Sample b = new Batch_Class_Sample();
        database.executeBatch(b);
        
    }
    
}