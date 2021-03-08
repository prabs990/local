trigger helloworldtrigger on Merchandise__c (before insert) {

    system.debug('hello world');
}