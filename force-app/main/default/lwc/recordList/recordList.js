import { LightningElement, api } from 'lwc';

export default class RecordList extends LightningElement {
    @api record;
    @api iconname;
    @api fieldname;

    handleSelect(event){
        event.preventDefault();
        const selectedRecord = new CustomEvent('select',{
            detail : this.record.Id
        });
        this.dispatchEvent(selectedRecord);
        console.log('selected record is '+this.record);
    }
}