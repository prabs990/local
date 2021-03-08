@istest(seealldata=true)
public class testdmloperation {

    public static testmethod void test()
    {
        //account a = new account(name='checktest');
        //insert a;
        //account a1= [select id,name from account where id=:a.id];
        dmloperation d= new dmloperation();
        d.docall();
    }
}