public with sharing class CampingListController {

    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        return [select id,name,Packed__c,Price__c,Quantity__c from camping_item__c];
    }
    @AuraEnabled
    public static Camping_Item__c saveItem (Camping_Item__c item){
        System.debug('item is=='+item);
        System.debug('item name is==+'+item.Name);
        System.debug('item price is==+'+item.price__c);
        System.debug('item quantity is==+'+item.quantity__c);
        upsert item;
        System.debug('return item is=='+item);
        return item;
        
    }
}