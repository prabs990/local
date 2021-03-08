public class Multiselect_demo_controller {

    public Employee__c empobj{set;get;}
    public String selectedvalue{get;set;}
    public List<String> lststring{set;get;}
    public Multiselect_demo_controller()
    {
        empobj=new Employee__C();
        lststring=new List<string>();
    }
    public void selectedValuemethod()
    {
        selectedvalue=empObj.Sample_Picklist__c;
         lststring =selectedvalue.split(';');
    }

}