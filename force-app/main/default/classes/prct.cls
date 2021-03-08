public class prct {

    public void getmap()
    {
        map<merchandise__c,list<line_item__c>> mapcon = new map<merchandise__c,list<line_item__c>>();
        list<merchandise__c> mer = [select id,name from merchandise__C];
        for(merchandise__C m:mer)
        {
            list<line_item__c> ltr= [select id,name from line_item__c where merchandise__r.id=:m.id];
            mapcon.put(m, ltr);
        }
        system.debug(mapcon);
         
         
     }
}