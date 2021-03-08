public class Custom_Setting {

    public List<New_Country_Code__c> codeValues {set;get;}
    
    public Custom_Setting()
    {
        codeValues = new List<New_Country_Code__c>();
        Map<String,New_Country_Code__c> allCodes = New_Country_Code__c.getall();
        
        System.debug('all codes----'+ allcodes);
        System.debug('for loop starting==');
        
        for(String str : allCodes.keySet())
        {
            System.debug('Key is ====' +Str);
            system.debug('full values of the record ' + allcodes.get(str));
            system.debug('name  is ' + allcodes.get(str).name);
            system.debug('code is' + allcodes.get(str).code__C);
        }
        
        
        System.debug('for loop ended==');
        codeValues=allcodes.values();
        System.debug('code values---' + codeValues);
        
        New_Country_Code__c c = new New_Country_Code__c();
          c=  New_Country_Code__c.getInstance('USA');
        					System.debug(c.code__c);
    }
        
    	
}