public with sharing class apexIfElse {
    public apexIfElse() {

    }
    @AuraEnabled(cacheable=true)
    public static string testString(){
        System.debug('inside aura method===');
        return 'apex class page';
    }
    @AuraEnabled(cacheable=true)
    public static Map<Integer,String> getMap(){
        Map<Integer,String> map1 = new Map<Integer,String>();
        map1.put(1, 'A');
        map1.put(2, 'B');
        map1.put(3, 'C');
        map1.put(4, 'D');
        return map1;
    }
}