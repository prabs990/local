@istest
public class restposttest {

    public static testmethod void doTest()
    {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        test.setMock(HttpCalloutMock.class, mock);
        
        httpresponse result = restpost.getData();
        
        system.assertNotEquals(null,result,'The callout returned a null response');
        
        Map<String,object> results = (Map<String,Object>)json.deserializeUntyped(result.getBody());
        List<Object> animal = (List<Object>)results.get('animals');
        
        System.assertEquals(3,animal.size(), 'mismatch');
    }
}