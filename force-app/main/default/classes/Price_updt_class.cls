public class Price_updt_class {

    public static void price_updt(List<Book__c> bList)
    {
        for(Book__c b : bList)
        {
            b.price__C=b.price__c*.9;
        }
    }
}