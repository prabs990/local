public class Opportunity_Handler {
    public Static void Trigger_After_Insert(List<Opportunity> oppNewList)
    {
        Update_Amount(oppNewList);   
    }
    
    public static void Trigger_After_Update(List<Opportunity> oppOldList, List<Opportunity> oppNewList)                              
    {
        Set<ID> accOldId = new Set<ID>();
        //new account update from below
		Update_Amount(oppNewList);
        
        Map<id,Opportunity> mapOpp = new Map<id,Opportunity> ();
        
        for(Opportunity opp: oppNewList)
        {
            mapopp.put(opp.id, opp);
        }
        
        for(Opportunity oppList: oppOldList){
            if(oppList.AccountId!=mapopp.get(oppList.id).accountid)
            {
                accOldId.add(oppList.AccountId);
            }
        }
        //new account update from below
        Update_Account(accOldId);
    }
    
    public static void Update_Amount(List<Opportunity> oppNewList)
    {
        Set<Id> accIdList;
        
        for(Opportunity oppList: oppNewList)
        {
            accIdList.add(oppList.accountId);
        }
        
        if(accIdList.size() > 0)
        {
            Update_Account(accIdList);
        }
    }
    
    Private static void Update_Account(Set<ID> accIdList){
        if(accIdList.size()>0){
            List<Database.SaveResult> lsr;
        	try{
                List<Account> updtAccount ;    
                map<id,account> mapAcc= new map<id,account>();
                for(Account a:[SELECT id,Tot_opp_amount__c,name, (SELECT name,amount__c FROM Opportunities) FROM Account WHERE id in :accIdList])
                {
                    a.Tot_opp_amount__c = 0;
                    for(Opportunity oppList: a.Opportunities)
                    {
                        If(oppList.amount__c!=null)
                        {
                            a.Tot_opp_amount__c = a.Tot_opp_amount__c + oppList.amount__c;
                        }
                    }
                    updtAccount.add(a);
					mapAcc.put(a.id,a); 
                }  
                lsr = database.update(updtAccount,false);
                  
            }
            catch(Exception E)
            {
				/**
                for(database.SaveResult sr:lsr)
                {
                    if(!(sr.issucess()))
                    {
                        database.Error err = sr.geterror()[0];
//                     account a=   mapacc.get(sr.getid);
//                     a.adderror('');  
                    }
                }
				**/
            }
        }
    }
}