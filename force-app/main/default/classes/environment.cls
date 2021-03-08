public class environment {

    public String tree{
        set
        {
         tree=value;
         if(tree<'0')
         {
             tree='0';
         }
        }
        get
        {
            return tree;
        }
    }
}