trigger classteacher_trigger on classteacher__c (before insert) {
    //set<id> teacherIdSet = new set<id>();
    
    set<id> classIdSet = new set<id>();
    map<id,Map<string,String>> teacherSubjectMap = new map<id,Map<string,String>>();
    map<id,List<classteacher__c>> classteachermap = new map<id,List<classteacher__c>>();
    list<string> subjectlist = new list<string>();
    
    for(classteacher__c c :trigger.new)
    {
        classIdSet.add(c.class__c);
        System.debug('inside loop1======');
    }
    //Subject is a formula field on Teacher. If a teacher can have multiple Subjects then move the Subject field to Junction object.
    for(classteacher__c c:[select id,name,class__c,Subject__c from classteacher__c where class__C in :classIdSet])
    {
        if(classteachermap.containsKey(c.class__c)){
            classteachermap.get(c.class__c).add(c);
            teacherSubjectMap.get(c.class__c).put(c.Subject__c,c.Subject__c);
        }
        Else{
            List<classteacher__c> listCt = new List<classteacher__c>();
            listCt.add(c);
            classteachermap.put(c.class__c,listCt);
            Map<string,String> mapSub = new Map<string,String>();
            mapSub.put(c.Subject__c,c.Subject__c);
            teacherSubjectMap.put(c.class__c, mapSub);
        }
    }
    
    for(classteacher__c c :trigger.new)
    {
        if(classteachermap.size() > 0){
            if(classteachermap.get(c.class__c).size() >= 6 ){
                c.addError('Maximum limit reached for child records');
            }
        }
        else if(teacherSubjectMap.size() > 0){
            if(teacherSubjectMap.get(c.class__c).containsKey(c.Subject__c)){
                c.addError('Maximum limit reached for Subject');
            }
        }
    }
}