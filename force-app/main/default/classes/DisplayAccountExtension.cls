public class DisplayAccountExtension {

    public List<Account> acclist{set;get;}
    public String accountIdSelected{set;get;}
    public Boolean displayPb1{set;get;}
    public List<contact> conlist{set;get;}
    
    public DisplayAccountExtension(apexpages.StandardController cont)
    {
        acclist=[select id,name from account];
        accountIdSelected='';
        displayPb1=false;
    }
    
    public List<SelectOption> getAccounts()
    {
        List<SelectOption> tmplist = new List<SelectOption>();
        tmplist.add(new SelectOption('None','---None---'));
        for(Account a:acclist) 
        {
            tmplist.add(new SelectOption(a.id,a.name));
        }
        return tmplist;
    }
    public pageReference searchContact()
    {
        displayPb1=true;
        System.debug('selected account id is ======'+accountIdSelected);
        conlist=[SELECT account.name,firstname,lastname FROM Contact where accountid = :accountIdSelected];
        return null;
         
    }
    
}