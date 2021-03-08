public class merchandiseinsert{

public static void insertmer(List<merchandise__C>  m)
{
    merchandise_archive__c ma= new merchandise_archive__c();
    ma.name=m[0].name;
    insert ma;
}
}