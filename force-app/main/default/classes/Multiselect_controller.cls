public class Multiselect_controller {

    public List<String> colorList{set;get;}
    public List<selectOption> colorDisplay{set;get;}
    
    public Multiselect_controller()
    {
        colorDisplay= new List<selectOption>();
        colorList= new List<String>();
        colorDisplay.add(new selectOption('None','--None--'));
		colorDisplay.add(new selectOption('red','red'));
        colorDisplay.add(new selectOption('green','green'));
        colorDisplay.add(new selectOption('yellow','yellow'));
        colorDisplay.add(new selectOption('pink','pink'));
        colorDisplay.add(new selectOption('black','black'));
        colorDisplay.add(new selectOption('blue','blue'));
        colorDisplay.add(new selectOption('orange','orange'));
                                                                            
    }
    public void getDummy()
    {
        
    }
}