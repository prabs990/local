public class employee {

    private string name='q';
    private integer age=2;
    
    public employee()
    {
        system.debug('default constructor starts');
        name='beta';
        age=20;
        system.debug('name and age'+name+age);
        system.debug('default constructor ends');
        
    }
    public employee(string name,integer age)
    {
        system.debug('para constructor starts');
        //this.name=name;
        //this.age=age;
        //name='alpha';
        //age=16;
        system.debug('name and age'+name+age);
        system.debug('para constructor ends');
    }
    public string getname()
    {
        return name;
    }
    public integer getage()
    {
        return age;
    }
}