import { LightningElement, api, track, wire } from 'lwc';
import fontevalogo from '@salesforce/resourceUrl/FontevaLogo';
import servicetitanlogo from '@salesforce/resourceUrl/servicetitanlogo';
import oraclelogo from '@salesforce/resourceUrl/oraclelogo';
import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

export default class ProjectRecord extends LightningElement {
    @api record;
    @track displayLogo;
    @track hover=false;
    @wire(CurrentPageReference) pageRef;
    connectedCallback(){
        if(this.record){
            if(this.record.Name=='Fonteva'){
                this.displayLogo = fontevalogo;
            }else
            if(this.record.Name=='Service Titan'){
                this.displayLogo = servicetitanlogo;
            }else
            if(this.record.Name=='Oracle'){
                this.displayLogo = oraclelogo;
            }
        }
    }
    

    handleClick(event){
        const recordclick = this.record;
        console.log('recordclick event fire==='+JSON.stringify(recordclick));
        fireEvent(this.pageRef, "projectname", this.record.Name);
    }
    handleHover(){
        this.hover = true;
    }
    handleOut(){
        this.hover = false;
    }
    get hoverClass(){
        if(this.hover==true){
            return 'slds-p-around_medium lgc-bg hoverColor';
        }else 
        if(this.hover==false){
            return 'slds-p-around_medium lgc-bg';
        }
    }
    
}