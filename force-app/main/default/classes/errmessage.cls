public class errmessage {
    public merchandise__C mer= new merchandise__c();
    public void setmer(String Name1,Double Phone1)
    {
        mer.Name=name1;
        mer.Merchandise_Price__c=phone1;
    }
    public merchandise__C getmer()
    {
        return mer;
    }
    public pagereference insert1()
    {    
        List<merchandise__C> m =[select name from merchandise__c where name=:mer.name];
        if(m.size()==0)
        {
        	insert mer;
        	apexpages.Message msg = new apexpages.Message(apexpages.Severity.CONFIRM,mer.name+'successfully inserted..');
            apexpages.addMessage(msg);
        
        }
        else
        {
           apexpages.Message msg1 = new apexpages.Message(apexpages.Severity.ERROR,mer.name+ 'already exists' + m.size()+ 'times..');    
           apexpages.addMessage(msg1); 	
        }
        return null;
	}
}