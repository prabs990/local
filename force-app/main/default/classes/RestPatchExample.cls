@RestResource(Urlmapping='/cases/*')
global with sharing class RestPatchExample {

    @HttpPatch
	
    global static Id doPatch()
    {
        RestRequest req = Restcontext.request;
        String caseId = req.requestURI.substring(req.requestURI.lastIndexof('/') + 1);
        Case caseObj = [select id from case where id =:caseId];
		Map<String,Object> caseMap = (Map<String,Object>)json.deserializeUntyped(req.requestBody.toString()); 
        for(String str : caseMap.keySet())
        {
            caseObj.put(str,caseMap.get(str));
        }
        update caseObj;
        return null;
    }
}