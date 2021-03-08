trigger upsContcat on Account (after update) {

    for(Account a : trigger.new){
        for(Contact c : [select id,phone from contact where accountid = :a.id]){
            System.debug('update number===');
            c.phone = '999999999';
            update c;
        }
    }
    
    
}