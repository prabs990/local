import { LightningElement, api, track } from 'lwc';
import findRecords from '@salesforce/apex/customLookupController.findRecords';
export default class CustomLookupLWC extends LightningElement {

    @track records;
    @track error;
    @track selectedRecord;
    @api iconname='standard:account';
    @api objectname='Account';
    @api searchfield='Name';
    @api index;
    @api relationshipfield;
 
    handleOnchange(event){
        //event.preventDefault();
        const searchKey = event.detail.value;
        console.log('searchkey in parent '+searchKey);
    
        //this.records = null;
        /* eslint-disable no-console */
        //console.log(searchKey);

        /* Call the Salesforce Apex class method to find the Records */
        if(searchKey!=undefined){
            console.log('serckey is not null'+searchKey);
            findRecords({
                searchKey : searchKey, 
                objectName : this.objectname, 
                searchField : this.searchfield
            })
            .then(result => {
                this.records = result;
                for(let i=0; i < this.records.length; i++){
                    const rec = this.records[i];
                    console.log('rec '+JSON.stringify(rec));
                    console.log('rec[] '+rec[this.searchfield]);
                    this.records[i].Name = rec[this.searchfield];
                }
                this.error = undefined;
                console.log(' records a', JSON.stringify(this.records));
            })
            .catch(error => {
                this.error = error;
                this.records = undefined;
                console.log('error is'+JSON.stringify(this.error));
                console.log('err detais '+ error.details);
                
            });
        }

    }

    handleSelect(event){
        //event.preventDefault();
        const selectedRecordId = event.detail;
        console.log('selectedRecordId==='+selectedRecordId);
        this.selectedRecord = this.records.find( record=>record.Id===selectedRecordId);
        console.log('this.selectedRecord==='+JSON.stringify(this.selectedRecord));
 // below event is for future if you want to find the selected record id in parent component
        const selectedRecordEvent = new CustomEvent('selectedrec',{
            //detail:selectedRecordId
            detail: {recordId : selectedRecordId,index:this.index,relationshipfield:this.relationshipfield}
        });
        this.dispatchEvent(selectedRecordEvent);       
    }
    handleRemove(event){
        event.preventDefault();
        console.log('delete this.records b'+this.records);
        this.selectedRecord = undefined;
        this.records = undefined;
        this.error = undefined;
        console.log('delete this.records a'+this.records);
        /* fire the event with the value of undefined for selected recordID*/
        const selectedRecordEvent = new CustomEvent('selectedrec',{
            detail : {recordId : undefined,index:this.index,relationshipfield:this.relationshipfield}
        })
        this.dispatchEvent(selectedRecordEvent);
    }
}