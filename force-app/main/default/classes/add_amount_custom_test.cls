@isTest
public class add_amount_custom_test {

    public static testmethod void add_amount_custom()
    {
        Opportunity opp = new Opportunity(name='try opp',CloseDate=date.today()+7,StageName='closed won');
        insert opp;
        Custom_Project__c cr = new Custom_Project__c(name='try1',opportunity__c=opp.id,amount__c=100);
        insert cr;
        Custom_Project__c cr1 = new Custom_Project__c(name='try2',opportunity__c=opp.id,amount__c=400);
        insert cr1;
        Opportunity opp1=[select id,name,total_amount__c from opportunity where id=:opp.Id];
        System.assertEquals(500, opp1.total_amount__c);
    }
}