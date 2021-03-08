public without sharing class GetAccountRecords {  
  
    @InvocableMethod
    public static void execute (List<Requests> requestList) {

        List<SObject> inputCollection = requestList[0].inputCollection;
        System.debug('inputCollection account ==='+inputCollection );
        SObject outputMember = inputCollection[0];
        System.debug('outputMember ==='+outputMember );        
    }

    public class Requests {

      @InvocableVariable(required=true)
      public List<SObject> inputCollection;
    }    
}