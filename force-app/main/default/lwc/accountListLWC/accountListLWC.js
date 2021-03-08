import { LightningElement,wire,track} from 'lwc';
import getAccountList from '@salesforce/apex/accountListLWC.getAccountList';
import getContactList from '@salesforce/apex/accountListLWC.getContactList';
export default class AccountListLWC extends LightningElement {
    @track searchKey;
    @track accountData;
    @track errors;
    @track srchContact;
    @track contactData;
    @track contactError;
    @track selectedAccount;

    @wire(getAccountList,{
        srchkey : '$searchKey'
    }) 
    wiredAccount({error,data}){
        if(data){
            this.accountData = data;
            this.errors=undefined;
            console.log('data returned is'+JSON.stringify(this.accountData));
        }
        if(error){
            this.errors = error;
            this.data=undefined;
            console.log('errors are'+JSON.stringify(this.errors));
        }
    }

    handleInput(event){
        this.searchKey = event.target.value;
        console.log('searcKey'+this.searchKey);    
    }
    searchContact(event){
        this.srchContact = event.target.value;
        console.log('srchContact'+this.srchContact);
    }
    handleClick(){
        getContactList({
            srchContact : this.srchContact
        })
        .then(result=>{
            this.contactData = result;
            this.contactError = undefined;
            console.log('contact data is '+JSON.stringify(this.contactData));
        })
        .catch(error=>{
            this.contactError = error;
            this.contactData = undefined;
            console.log('error is '+JSON.stringify(this.contactError));
        });

    }
    handleSelect(event){
        const recordId = event.detail;
        console.log('recordId'+recordId);
        //this.selectedAccount = this.accountData.find( account => account.Id === recordId);
        for(let i = 0 ; i< this.accountData.length; i++){
            if(this.accountData[i].Id===recordId){
                this.selectedAccount = this.accountData[i];
            }
        }
        console.log('this.selectedAccount'+this.selectedAccount);
    }
}