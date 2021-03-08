import { LightningElement,track,api } from 'lwc';
import getRelatedContacts from '@salesforce/apex/ContactController.getRelatedContacts';
    const COLUMNS = [
        {label : 'Name', fieldName: 'Name'},
        {label : 'Phone',fieldName: 'Phone',type: 'phone'},
        {label : 'Email', fieldName: 'Email', type:'email'}
    ];
export default class ParentComponent extends LightningElement {
    @track columns = COLUMNS;
    @track data;
    @api recordId;
    @track isError= false;
    @track errorMessage;

    connectedCallback(){
        this.loadRelatedContacts();
    }
    
    loadRelatedContacts(){
        getRelatedContacts({accountId : this.recordId})
        .then(results=>{
            this.data=results;
            this.isError=false;
        })
        .catch(error=>{
            this.isError = true;
            this.errorMessage = error.body.message;
        });
    }
}