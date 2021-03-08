public class try5 {

    public void getmap()
    {
        Map<Merchandise__c,List<Line_Item__c>> mapcon = new map<merchandise__c,list<Line_Item__c>>();
        Merchandise__c mer = [select name from Merchandise__C where name = 'shorts'];
        List<Line_Item__c> lstacc = [select id,name from Line_Item__c where Merchandise__r.Name=:mer.name];
        system.debug('line items are '+lstacc);
        mapcon.put(mer, lstacc);
        system.debug('map is'+ mapcon);
    }
}