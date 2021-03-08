public without sharing class GetFirstFromCollection {  
  
    @InvocableMethod
    public static void execute (List<Requests> requestList) {

        List<SObject> inputCollection = requestList[0].inputCollection;
        System.debug('inputCollection ==='+inputCollection );
        SObject outputMember = inputCollection[0];
        System.debug('outputMember ==='+outputMember );        
        //Create a Results object to hold the return values
        Results response = new Results();

        //Add the return values to the Results object
        response.outputMember = outputMember;
        System.debug('response.outputMember==='+response.outputMember);
        
        //Wrap the Results object in a List container 
        //(an extra step added to allow this interface to also support bulkification)
        List<Results> responseWrapper= new List<Results>();
        responseWrapper.add(response);
        
//        return responseWrapper;    
        
    }

    public class Requests {

      @InvocableVariable(required=true)
      public List<SObject> inputCollection;
    }    

    public class Results {     

      @InvocableVariable
      public SObject outputMember;
    }
}