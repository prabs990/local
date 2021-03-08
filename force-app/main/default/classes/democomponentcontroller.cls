public class democomponentcontroller {

    Public String objectName{set;get;}
    Public String query;
    Public List<sObject> sObjLst{set;get;}
 
    public List<sObject> getrecords()
    {
        query = 'select id,name from ' +objectName;
        sObjLst = database.query(query);
        return sObjLst;
    }
}