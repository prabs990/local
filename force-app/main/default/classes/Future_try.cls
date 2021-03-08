public class Future_try {

    public void try1()
    {
        System.debug('try1');
    }
    @future
    public static void try2()
    {
        System.debug('try2');
        try4();
    }
    public void try3()
    {
        system.debug('try3');
    }
    public static void try4()
    {
        system.debug('try4');
    }
}