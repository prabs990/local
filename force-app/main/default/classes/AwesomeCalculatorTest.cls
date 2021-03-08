@isTest
public class AwesomeCalculatorTest {

    public static testmethod void doTest()
    {
        test.setMock(WebServiceMock.class, new calculatorcalloutmock());
        
        double x= 1;
        double y = 3;
        
        double result = awsomecalculator.add(x,y);
        system.assertEquals(3, result);
    }
}