trigger acounttype on Account (before insert) {

    Map<Id,String> accMap = new Map<Id,String>();
    String alpha,beta;
    
    for(Account a : trigger.new){
        if(a.sample__c=='A'){
            alpha='A00%';
        }
        else{
            if(a.sample__c=='B'){
                alpha='B00%';
            }
        }
        accMap.put(a.id, a.account_type__c);
    }
    List<AggregateResult> Result =[SELECT Count(Id) Total , account_type__c FROM Account WHERE id in :accmap.keySet() and account_type__c like :alpha group by account_type__c];               
    If(result.size()>0){
        Integer cou = (Integer) result[0].get('expr0');
        System.debug('cou===='+cou);
        
        for(Account a : [select id from account where id in :accmap.keySet()]){
                    }
    }
        
    
//    Integer c = [select count() from account where account_type__c like :alpha]
}