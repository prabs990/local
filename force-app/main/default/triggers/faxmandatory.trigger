trigger faxmandatory on Lead (before insert) {

    for(lead l:trigger.new)
    {
        if(l.fax==null)
        {
            l.adderror('fax cannot be null');
        }
    }
}