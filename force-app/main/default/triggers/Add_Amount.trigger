trigger Add_Amount on Custom_Project__c (After Insert) {

    If(Trigger.isInsert)
    {
        Set<Id> idList= new Set<Id>();
        for(Custom_Project__c c:trigger.new)
        {
            idList.add(c.opportunity__C);
        }
        List<Opportunity> opplist1= [select id,total_amount__c,(select id, amount__c from Custom_Projects__r) from Opportunity where id in :idList];
        Decimal tAmount=0;
        for(Opportunity opp: opplist1)
        {
            for(Custom_Project__c c:opp.Custom_Projects__r)
            {
                tAmount=tAmount + c.amount__c;
            }
            opp.total_amount__c=tAmount;
            update opp;
        }
        
        /*        List<Custom_Project__c> crList=[SELECT id,name FROM Custom_Project__c WHERE opportunity__c in :idList];
        Map<Id,opportunity> oppmap= new Map<Id,opportunity>([select id,name from opportunity]);
        
        if(crList.size()==1)
        {
            for(Custom_Project__c cr : trigger.new)
            {
                oppmap.get(cr.opportunity__C).total_amount__C = cr.amount__c;
                update oppmap.get(cr.opportunity__C);        
            }
        }
        else if(crList.size()>1)
        {
            Double tAmount=0;
            List<Custom_project__c> crList2=[select id,amount__c from Custom_Project__c where opportunity__C in :idlist];
            
            for(Custom_project__c c:crList2)
            {
                tAmount=tAmount + c.amount__c;
            }
            for(Custom_Project__c cr : trigger.new)
            {
                oppmap.get(cr.opportunity__C).total_amount__C = tAmount;
            }
        }
    }
*/
/*    List<opportunity> listid = new List<opportunity>();
    for(Custom_Project__c cp:trigger.new)
    {
           Map<id,Custom_Project__c> oldmap=trigger.oldmap;
           system.debug('cp.amount__c===='+cp.amount__c);
           system.debug('cp.amount__c===='+cp.opportunity__r.total_amount__c);
           listid.add(cp.opportunity__r);
           system.debug('listid==='+listid);
        }
    Map<id,opportunity> mapopp = new Map<Id,Opportunity>([select id,name from opportunity where id in :listid]);
    system.debug('mapopp==='+mapopp);
*/

            }
}