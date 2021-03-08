trigger teachercount on classteacher__c (before insert) {

    List<Id> classIdSet = new List<Id>();
    Map<Id,Map<String,String>> mapClassSubject = new Map<Id,Map<String,String>>();
	Map<Id,List<Id>> mapClassTeacher = new Map<Id,List<Id>>();
    
    for(classteacher__c c :Trigger.new)
    {
        classIdSet.add(c.class__c);
    }
    for(classteacher__c c : [select id,name,teacher__c,class__c,subject__c from classteacher__c where class__c in :classIdSet])
    {

        if((mapClassTeacher.containskey(c.class__c)))
        {
            //teacher count
               List<Id> tList = mapClassTeacher.get(c.class__c);
               tList.add(c.teacher__c);
               mapClassTeacher.put(c.class__c,tList);
            
           //subject 
           
               Map<String,String> sMap = mapClassSubject.get(c.class__c);
               sMap.put(c.Subject__c, c.Subject__c);
               mapClassSubject.put(c.class__c,sMap);
               
        }
        else
           {

		//teacher count               
            List<Id> tList = new List<Id>() ;
            tList.add(c.teacher__c);
            mapClassTeacher.put(c.class__c,tList);

       //subject field
              Map<String,String> sMap = new Map<String,String>();
			   smap.put(c.Subject__c,c.Subject__c);
               mapClassSubject.put(c.class__c, sMap);
               
           }
    }
    for(classteacher__c c : trigger.new)
    {

        if(mapClassTeacher.size()>0)
        {
                if(mapClassTeacher.get(c.class__c).size()>= 3)
               {
                   c.adderror('Maximum Limit Reached for classes');
               }
        }
        if(mapClassSubject.size()>0)
        {
            if(mapClassSubject.get(c.class__c).containskey(c.Subject__c))
            {
                c.adderror('Maximum Limit reached for subjects');
            }
        }
    }
}