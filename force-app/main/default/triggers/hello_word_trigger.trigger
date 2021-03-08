trigger hello_word_trigger on Account (before insert) {

    for(account a:trigger.new)
    {
        if(a.hello__c=='' || a.hello__C==null)
        {
            a.hello__c='world';    
        }
        else if(!(a.hello__c.startswith('hello')))
        a.hello__c='world';
    }
}