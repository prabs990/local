public class search1
{
    String keyword,queryString;
    boolean re=false;
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public ApexPages.StandardSetController standardSetCtrl {
     get{
            if(standardSetCtrl == null){
                size = 10;
                
                standardSetCtrl = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                standardSetCtrl.setPageSize(size);
                noOfRecords = standardSetCtrl.getResultSize();
            }
            return standardSetCtrl;
        }set;
    }
    public void setkeyword(String Find)
    {
        keyword=find;
    }
    public string getkeyword()
    {
        return keyword;
    }
    public  list<employee__C> getmer()
    {
         List<employee__c> empList = new List<employee__c>();
        for(employee__c a : (List<employee__c>)standardSetCtrl.getRecords())
            emplist.add(a);
        return empList;
    }
    public void dosearch()
    {
        re=true;
        queryString = 'select id,name,State_Province__c from employee__c where State_Province__c=:keyword order by name';
    }
    public boolean getre()
    {
        return re;
    }
    
}