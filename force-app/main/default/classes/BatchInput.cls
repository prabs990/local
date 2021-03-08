public class BatchInput{
    
    public BatchInput(){
        
        List<Account> accList = new List<Account>();
        
        Account a1 = new Account(name='AccTest1');
        Account a2 = new Account(name='AccTest2');
        Account a3 = new Account(name='AccTest3');
        Account a4 = new Account(name='AccTest4');
        Account a5 = new Account(name='AccTest5');
        Account a6 = new Account(name='AccTest6');
        Account a7 = new Account(name='AccTest7');
        Account a8 = new Account(name='AccTest8');
        Account a9 = new Account(name='AccTest9');
        Account a10 = new Account(name='AccTest10');
        
        accList.add(a1);
        accList.add(a2);
        accList.add(a3);
        accList.add(a4);
        accList.add(a5);
        accList.add(a6);
        accList.add(a7);
        accList.add(a8);
        accList.add(a9);
        accList.add(a10);
        
        Batch_Class_Sample b1 = new Batch_Class_Sample(accList);
        Database.executeBatch(b1,2);
    }
}