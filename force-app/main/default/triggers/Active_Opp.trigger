trigger Active_Opp on Custom_Project__c (before insert) {

    Set<Id> idList = new Set<Id>(); 
    for(Custom_Project__c c : trigger.new)
    {
        if(c.status__c=='active')
        {
            idList.add(c.Opportunity__c);
        }
    }
    
    List<opportunity> oppList= new List<opportunity>();
    
    for(opportunity opp : [select id,name,Active_Customer_project__c from opportunity where id in :idList])
    {
       opp.Active_Customer_project__c=true;
       oppList.add(opp); 
    }
    update oppList;
}