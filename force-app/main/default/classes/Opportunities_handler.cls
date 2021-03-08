public class Opportunities_handler {

    public static void After_Insert_Trigger(List<Opportunity> oppList)
    {
        Update_TotalAmount_On_Account(oppList);
    }
    
    public static void After_Update_Trigger(List<Opportunity> oppOldList,List<Opportunity> oppNewList)
    {
        Map<Id,Opportunity> oppNewMap = new Map<Id,Opportunity>();
        Set<Id> accOldSet = new Set<Id>();
        
        Update_TotalAmount_On_Account(oppNewList);
        
        for(Opportunity opp : oppNewList)
        {
        	oppNewMap.put(opp.Id,opp);    
        }
        
        for(Opportunity opp : oppOldList)
        {
        	if(opp.AccountId!=oppNewMap.get(opp.Id).accountId)
            {
                accOldSet.add(opp.AccountId);
            }
        }
        if(accOldSet.size()>0)
        {
        	Calculate_TotalAmount_On_Account(accOldSet);
        }    
    }
    
    private static void Update_TotalAmount_On_Account(List<Opportunity> oppList)
    {
        Set<Id> accIdList = new Set<Id>();
        
        for(Opportunity opp : oppList)
        {
            accIdList.add(opp.accountid);
        }
        
        if(accIdList.size()>0)
        {
        	Calculate_TotalAmount_On_Account(accIdList);
        }    
    }
    
    private static void Calculate_TotalAmount_On_Account(Set<Id> accIdList)
    {
        List<Account> accUpdtList = new List<Account>();
        List<Database.SaveResult> lsr = new List<Database.SaveResult>();
        List<String> errList = new List<String>();
        
        try
        {
        
            for(Account a:[SELECT id,Tot_opp_amount__c,(SELECT id,amount__c FROM Opportunities) FROM Account WHERE id IN : accIdList])
            {
                a.Tot_opp_amount__c=0;
                for(Opportunity opp : a.Opportunities)
                {
                    if(opp.amount__c!=null)
                    {
                       a.Tot_opp_amount__c += opp.amount__c;
                    }   
                }
                accUpdtList.add(a);
            }
            
             lsr = Database.update(accUpdtList,false);
    	}
        catch(Exception e)
        {
			 for(Database.SaveResult sr : lsr)
             {
                 if(!(sr.isSuccess()))
                 {
                     String errDetail = 'Account name is = ' + ',' + sr.getErrors()[0].getMessage() + '<br/>';
                     errList.add(errDetail);
                 }
             }
        }
        finally
        {
            System.debug('final');
        }
    }
}