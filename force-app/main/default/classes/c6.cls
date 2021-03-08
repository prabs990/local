public class c6
{
    Merchandise__c mer;
    
    public c6()
    {
        mer=[select name from merchandise__c where name='pajama1'];
       
    }
    public merchandise__C getmer()
    {
        return mer;
    }
    public void upd()
    {
        update mer;
    } 
}