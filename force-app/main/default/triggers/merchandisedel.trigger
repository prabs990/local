trigger merchandisedel on Merchandise__c (after delete) {

    
        for(Merchandise__c m :trigger.old)
            {
                merchandise_archive__c ma = new  merchandise_archive__c(); 
                ma.name=m.name;
                insert ma;
            }
 
}