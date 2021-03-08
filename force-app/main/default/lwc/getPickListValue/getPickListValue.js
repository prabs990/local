import { LightningElement, wire, track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_SOURCE from '@salesforce/schema/Account.AccountSource';
import ACCOUNT from '@salesforce/schema/Account';

export default class GetPickListValue extends LightningElement {

    @track pickValue;
    @track error;

    @wire(getPicklistValues , {
        recordTypeId : '012000000000000AAA',
        fieldApiName : ACCOUNT_SOURCE
    })
    wiredPickListValue({ data , error }){
        if(data){
            this.pickValue = data.values;
            this.error = undefined;
            console.log('data');
            console.log('ACCOUNT '+ACCOUNT);
            console.log('ACCOUNT data'+ACCOUNT.data);
            //console.log('Account field api'+ACCOUNT.fieldApiName.AccountSource);
            console.log('Account values'+ACCOUNT.values);
            console.log('Account values strinify'+JSON.stringify(ACCOUNT));
        }
        if(error){
            this.error = error;
            this.pickValue = undefined;
            console.log('error');
        }
    }
    

    
}