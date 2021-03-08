trigger share_merchandise on Merchandise__c (after insert) {

    id shareid = [select id from user where alias ='ccapo'].id;
    for(merchandise__c m:trigger.new)
    {
        merchandise__share mshare = new merchandise__share();
        mshare.ParentId=m.id;
        mshare.AccessLevel='read';
        mshare.UserOrGroupId=shareid;
        
        insert mshare;
    }
}