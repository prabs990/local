public class AwsomeCalculator {

    public static double add(double x, double y)
    {
        calculatorservices.CalculatorImplPort calculator = new calculatorservices.CalculatorImplPort();
        return calculator.doadd(x,y);
    }
}