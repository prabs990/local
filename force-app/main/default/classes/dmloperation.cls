public class dmloperation {

    public void docall()
    {
        //account a = new account(name='helloaccount');
        //insert a;
        list<account> acc=[select id,name from account];
        list<account> act = new list<account>();
        for(account a1:acc)
        {
            a1.name= a1.Name + 'i';
            act.add(a1);
        }
        update act;
    }
}