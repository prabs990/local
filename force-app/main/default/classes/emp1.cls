public class emp1
{
    public list<employee__c> emplist {set;get;}
    public emp1()
    {
        emplist = [select id,name from employee__c];
    }
   
}