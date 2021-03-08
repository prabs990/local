@istest
public class prefix_doc_lead_test {

    public static testmethod void test()
    {
        Lead leadobj = new lead(lastname='singh',firstname='cheka',company='c',status='Closed Converted');
        insert leadobj;
        Lead l3 = [SELECT id,firstname FROM Lead WHERE id = :leadobj.id];
        system.assertEquals('dr.cheka', l3.firstname);
        Lead l1=new lead(lastname='cheetah',company='c',status='Closed Converted');
        insert l1;
        Lead L4 = [select id,firstname from Lead where id= :l1.Id];
        system.assertEquals('dr.', l4.FirstName,'second condition');
    }
        
}