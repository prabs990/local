import { LightningElement, track } from 'lwc';
import { fireEvent } from 'c/pubsub';
export default class FilterOptions extends LightningElement {

    @track sortorder='ASC';

    handlesort(){
        this.sortorder = this.sortorder=='ASC'?'DESC':'ASC';
        console.log('sort order now is'+this.sortorder);
        fireEvent(this.pageRef, "sortdirection", this.sortorder);
    }
    handleLookup(event){
        const clientid = event.detail.recordId;
        console.log('client id is==='+clientid);
        fireEvent(this.pageRef, "filterbyclient", clientid);
    }
}