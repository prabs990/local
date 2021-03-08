public class Queueable_class implements Queueable{

    public Contact c;
    public String billState;
    public Queueable_class(Contact c , String billState)
    {
        this.c = c;
        this.billState = billState;
    }
    public void execute(Queueablecontext qc)
    {
        List<Account> accList = [SELECT name FROM Account WHERE BillingState = :billState];
        List<Contact> conList = new List<Contact>();
        for(Account a : accList)
        {
            Contact newContact = c.clone();
            newContact.AccountId=a.id;
            conList.add(newContact);
        }
        insert conList;
    }
}