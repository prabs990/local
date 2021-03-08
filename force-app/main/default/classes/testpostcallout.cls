@isTest
public class testpostcallout {

    public static testmethod void doTest()
    {
        test.setMock(httpcalloutmock.class, new ResponseClass());
        Httpresponse response = restpost.postData();
        String actualvalue = response.getBody();
        String expectedvalue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        system.assertEquals(expectedvalue, actualvalue,'valuemismatch');
    }
}