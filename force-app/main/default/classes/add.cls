public class add {

    public integer a=20;
    public integer b=14;
    public integer c=0;
    
    public void sum()
    {
        if (a<10)
        {
        c=a+b;
        system.debug('sum is '+c);
        }
        else
        {
            c=a-b;
            system.debug('differ is ' +c);
        }
    }
        
}