trigger prefix_doc_lead on Lead (before insert,before update) {

    for(Lead l:trigger.new)
    {
        if(l.firstname!=null && l.firstname!='')
        {
            if(!(l.firstname.startswith('dr.')))
            {
                l.firstname='dr.'+l.firstname;
            }
                
        }
        else
        {
            l.firstname='dr.';
        }
    }
}