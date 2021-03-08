import { LightningElement,api,track } from 'lwc';
import MSG_JSON_FORMAT from '@salesforce/label/c.MSG_JSON_FORMAT';
import trailheadImage from '@salesforce/resourceUrl/trailheadImage';
import userId from '@salesforce/user/Id';
import accountObj from '@salesforce/schema/Account';
import nameField from '@salesforce/schema/Merchandise__c.Merchandise_Price__c';
import currency from '@salesforce/i18n/currency';

export default class DesignAttributeLWC extends LightningElement {
    @api InputVariable1;
    @api InputVariable2;
   
    @api label = {
        MSG_JSON_FORMAT,
        trailheadImage,
        userId,
        nameField,
        currency,
        accountObj
        
    }
    

        


        
    
    
}