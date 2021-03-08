public class contactExtension{
//    public List<Contact> contactList{set;get;}
    public String accId{set;get;}
    public String soql {get;set;}
    public List <Contact> CandidateList1 = New List <Contact>();
    public String soqlsort {get;set;}
    public List <Contact> CandidateList2 = New List <Contact>();
    public String tempSortField;

    // List used in to display the table in VF page.
        public List<Contact> getContactList() {
        // Passing the values of list to VF page.
        return con.getRecords();
        }
        
        public contactExtension(ApexPages.StandardController co){
        } 
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                   
                    accId = ApexPages.currentPage().getParameters().get('parentId');
                    String query = 'SELECT ';
                    for(Schema.FieldSetMember f : this.getFields()) {
                        query += f.getFieldPath() + ', ';
                    }
                    query += 'Id FROM Contact where accountId=:accId order by ' + sortField + ' ' + sortDir ;
                    CandidateList1 =  Database.query(query);
                    con = new ApexPages.StandardSetController(CandidateList1);
                    // sets the number of records in each page set
                    con.setPageSize(10);
        
            }
            return con;
        }
        set;
    }    
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Contact.FieldSets.inlineEdit.getFields();
    }


   public void save(){
//       update contactList;
//        update con.getRecords;
        List<Contact> contactUpdate = getContactList();
        update contactUpdate;
//        toggleSort01();
   }

    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }

    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }

    public void first() {
        con.first();
    }

    public void last() {
        con.last();
    }

    public void previous() {
        con.previous();
    }

    public void next() {
        con.next();
    }

    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
        con.cancel();
    }

    // Method for Constructor is used for Test Class.
//    public StandardPaginationSorting(){
//    }
    
   //Toggles the sorting of query from asc<-->desc
    public void toggleSort() {
        tempSortField = sortField;
        
        // simply toggle the direction
        
        sortDir = sortDir.equals('asc') ? 'desc' : 'asc';

        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM Contact where accountId=:accId order by ' + sortField + ' ' + sortDir ;
        CandidateList2 =  Database.query(query);
        con = new ApexPages.StandardSetController(CandidateList2);
        // sets the number of records in each page set
        con.setPageSize(10);
    }
// to display the records after save method , so that it respects the last sorting order
    public void toggleSort01() {
        // simply toggle the direction
        sortDir = sortDir.equals('asc') ? 'asc' : 'desc';

        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM Contact where accountId=:accId order by ' + sortField + ' ' + sortDir ;
        CandidateList2 =  Database.query(query);
        con = new ApexPages.StandardSetController(CandidateList2);
        // sets the number of records in each page set
        con.setPageSize(10);
    }
    
    // the current sort direction. defaults to asc
    public String sortDir {
        // To set a Direction either in ascending order or descending order.
        get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;}
        set;
    }

    // the current field to sort by. defaults to last name
    public String sortField {
        // To set a Field for sorting.
        get  { if (sortField == null) {sortField = 'FirstName'; } return sortField;  }
        set;
    }    
}