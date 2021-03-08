global class InboundEmail implements Messaging.InboundEmailHandler{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope)
    {
        Messaging.InboundEmailResult result = new messaging.InboundEmailResult();
        
        String subToCompare = 'Create Contact';
        System.debug('After Create Contact');
        if(email.subject.equalsIgnoreCase(subToCompare))
        {
            Contact c = new Contact();
            System.debug('Inside IF');
            System.debug('email.plainTextBody==='+email.plainTextBody);
            c.LastName = email.plainTextBody;
            System.debug('c.LastName==='+c.Lastname);
            System.debug('c.Name==='+c.name);
//            c.Lastname = email.fromName;
            insert c;
            System.debug('after contact insert');
            //checking for attachments- TEXT
            
            if(email.textAttachments != null && email.textAttachments.size()>0 )
            {
                System.debug('Inside outer IF');
            	for(Messaging.InboundEmail.TextAttachment tAttachment : email.textAttachments)
            	{
                	System.debug('Inside email');
                    Attachment attachment = new Attachment();
                    attachment.name = tAttachment.fileName;
                    attachment.Body= Blob.valueOf(tAttachment.body);
                    attachment.ParentId=c.Id;
                    insert attachment;
                    System.debug('Outside email');
            	}
                System.debug('Inside outer IF1');
            }
            else
            {
                System.debug('No text attachments');
                if(email.binaryAttachments!=null && email.binaryAttachments.size()>0)
                {
                   for(Messaging.InboundEmail.binaryAttachment tAttachment : email.binaryAttachments)
                    {
                        System.debug('Inside binary ');
                        Attachment attachment = new Attachment();
                        attachment.name = tAttachment.fileName;
                        attachment.Body= tAttachment.body;
                        attachment.ParentId=c.Id;
                        insert attachment;
                        System.debug('Outside binary');
                    }
                    
                }
                else
                {
                    System.debug('No Binary attachment');
                }
            }
            
            //Checking for Binary attachments
            
        }
        
        result.success = true;
        return result;
    }
}