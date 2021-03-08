public class SchemaObject {

    public Map<String,Schema.sObjectType> mObjects{set;get;}
    public List<String> objLst{set;get;}
    public List<SelectOption> objects{set;get;}
    public String selectedObj{set;get;}
    public String objDescription{set;get;}
    public SchemaObject()
    {
        mObjects = new Map<String,Schema.sObjectType>();
        objLst = new List<String>();
        objects = new List<SelectOption>();
        
        mObjects = Schema.getGlobalDescribe();
        objLst.addAll(mObjects.keySet());
        objLst.sort();
        objects.add(new selectOption('None','--None--'));
        for (String s : objLst)
        {
            selectOption op = new selectOption(s,s);
            objects.add(op);
        }
    }
    
    public void details()
    {
        Schema.DescribeSObjectResult myObj = mObjects.get(selectedObj).getDescribe();
        objDescription = ''+myObj;
    }
    
}