public class contactExtension01{
    public List<Contact> contactList{set;get;}
    public String accId{set;get;}
    public integer counter=0;
    public integer list_size=10;
    public integer total_size;
    
    public contactExtension01(){
        contactList = new List<Contact>();
        contactList=[Select id from Contact where accountId=:accId];
        total_size = contactList.size();
        accId = ApexPages.currentPage().getParameters().get('parentId');
        contactList = getContacts();
    
    }
    
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Contact.FieldSets.inlineEdit02.getFields();
    }

    private List<Contact> getContacts() {
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM Contact where accountId=:accId limit :list_size offset :counter';
        return Database.query(query);
    }

   public void save(){
       update contactList;
   }
   public void cancel(){
   }
    /*Adding Pagination to the page */

    public PageReference Beginning() {
        counter = 0;
        contactList = getContacts();
        return null;
    }

    public PageReference Previous() {
        counter -= list_size;
        contactList = getContacts();
        return null;
    }

    public PageReference Next() {
        counter += list_size;
        System.debug('Contact list before next==='+contactList);
        contactList = getContacts();
        System.debug('Contact list after next==='+contactList);
        return null;
    }

    public PageReference End() {
        if(total_size - math.mod(total_size,list_size) == total_size)
            counter = total_size - math.mod(total_size,list_size) - list_size ;
        else
            counter = total_size - math.mod(total_size,list_size);
            contactList = getContacts();
            return null;
    }

    public Boolean getdisablePrevious() {
        if (counter == 0)
            return true;
        else
            return false;
    }

    public Boolean getdisableNext() {
        if (counter >= total_size - list_size)
            return true;
        else
            return false;
    }

    
    
}