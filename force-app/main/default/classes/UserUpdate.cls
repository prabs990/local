public class UserUpdate{

    public static void updateUserMethod(List<Contact> records){
        
        Map<Id,User> allUser = new Map<Id,User>();
        
        for(User u : [SELECT id,contactId,email from User]){
            allUser.put(u.contactId,u);
        }
        
        List<User> userToUpdate = new List<User>();
        for(Contact con : records){
            Contact oldContact = (contact)trigger.oldMap.get(con.id);
            if(allUser.containsKey(con.id)){
                if(oldContact.email!=con.email){
                    System.debug('Email id mismatch===');
                    allUser.get(con.id).email = con.email;
                    userToUpdate.add(allUser.get(con.id));
                }
            }    
        }
        if(userToUpdate.size()>0){
            update userToUpdate;
        }
    }
}