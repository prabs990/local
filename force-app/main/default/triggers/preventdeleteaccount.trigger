trigger preventdeleteaccount on Account (before delete) {
     
    map<id,profile> profilesid = new map<id,profile>([select id,name from profile where name='system administrator']);
//    system.debug('profile id is ==='+profilesid);
    for(account a:trigger.old)
    {
 
        if(!(profilesid.containsKey(userinfo.getProfileId())))
        {
           a.adderror('you are not the admin , hence cant delete any record BOY!'); 
        }
         
    }

}