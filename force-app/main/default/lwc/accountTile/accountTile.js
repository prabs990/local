import { LightningElement, api } from 'lwc';

export default class AccountTile extends LightningElement {
    @api account;
    handleSelect(event){
        event.preventDefault();
        const sendData = new CustomEvent('selectt',
                                        {detail : this.account.Id});
        console.log('firing event===');                                
        this.dispatchEvent(sendData);
    }
}