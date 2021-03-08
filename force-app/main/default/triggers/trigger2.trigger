trigger trigger2 on Merchandise__c (after insert) {

Invoice__c l = new Invoice__c();
for(Merchandise__c m : trigger.new)
    {
    
    l.Invoice_Description__c='INV0009';
    
    insert l;
    }
}