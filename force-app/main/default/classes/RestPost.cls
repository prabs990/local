public class RestPost {

    public static HttpResponse postData()
    {
        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"moose"}');
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==201){
            system.debug('body is ' + response.getBody());
        }
        else{
            system.debug('Error code '+  response.getStatus() + response.getStatusCode());
        }
        
        return response;
       
    }
    
        public static HttpResponse getData()
    {
        HttpRequest request = new HttpRequest();

        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            Map<String,Object> result = (Map<String,Object>)json.deserializeUntyped(response.getBody());
        }
        else{
            system.debug('Error code '+  response.getStatus() + response.getStatusCode());
        }
        return response;
       
    }
}