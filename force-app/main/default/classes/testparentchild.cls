@istest
public class testparentchild {

    public static testmethod void dotest()
    {
       account a = new account(name='alpha');
        insert a;
        contact c = new contact(lastname='alpha1',email='aj@gmail.com',accountid=a.id);
        insert c;
       parentchild p = new parentchild();
        p.pc();
    }
}