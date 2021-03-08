public class mer_first_page_controller {

    public List<Account> accList1{set;get;}
    public List<Account> accList2{set;get;}
    
    public mer_first_page_controller()
    {
        accList1 =[select id,name,phone from account];
        accList2=[select id,name,email__c from account];
    }
    
    public PageReference pageDisplay()
    {
        return Page.page4;
    }
}