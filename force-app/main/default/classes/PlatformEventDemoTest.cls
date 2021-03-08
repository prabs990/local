@istest
public class PlatformEventDemoTest {

    public static testmethod void doTest()
    {
        Cloud_News__e cn = new cloud_news__e();
        cn.Location__c='Okhla';
        cn.Urgent__c=true;
        cn.News_Contenty__c = 'reach immediately';
        
        test.startTest();
        	database.SaveResult sr = EventBus.publish(cn);

        test.stopTest();
            system.assertEquals(true,sr.isSuccess());
        	system.debug('srsuccess is ==='+sr.isSuccess());
        
        	list<case> cases = [select id from case];
        	system.assertEquals(1, cases.size());

    }
}