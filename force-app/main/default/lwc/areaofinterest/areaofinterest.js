import { LightningElement, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import  getDetails  from '@salesforce/apex/areaofinterestcontroller.getDetails';
import saveAoi from '@salesforce/apex/areaofinterestcontroller.saveAoi';
export default class Areaofinterest extends LightningElement {
    @track recordData;
    @track error;
    @track sel;
    @track aoiToUpdate;
    @track savedString;
    @track saveerror;
    @track objMetadataValues = {};
    @track checkedAoi = new Array();
    @track uncheckedAoi = new Array();
    @track displayPopOver=false;

    @wire(getRecord, { recordId: 'm026F000000gEZjQAM', fields: 
            ['areaofinterest__mdt.MasterLabel',  
            'areaofinterest__mdt.pagetitle__c','areaofinterest__mdt.pagedescription__c'] })
    metaData({error, data}) {
        if(data) {
            let currentData = data.fields;
            this.objMetadataValues = {
                MasterLabel : currentData.MasterLabel.value,
                PageTitle: currentData.pagetitle__c.value,
                PageDescription: currentData.pagedescription__c.value

            }
        } 
        else if(error) {
            window.console.log('error ====> '+JSON.stringify(error))
        } 
    }
    @wire(getDetails)
    getData({data,error}){
        if(data){
            this.recordData = data;
            this.error = undefined;
            for(var i = 0 ; i < this.recordData.length ; i++){
                if(this.recordData[i].isChecked==true){
                    console.log('checked value on load is'+this.recordData[i].aoiValue);
                    this.checkedAoi.push(this.recordData[i].aoiValue);
                }
            }
        }
        if(error){
            this.recordData = undefined;
            this.error = error;
        }
    }
    handleCheckbox(event){
      //  console.log('check==='+event.target.checked);
      //  console.log('check1==='+event.target.value);
        if(event.target.checked){
            this.checkedAoi.push(event.target.value);
            //this.uncheckedAoi.splice(this.uncheckedAoi.indexOf(event.target.value),1);
            let valToRemove = event.target.value;
            for(let i = 0 ; i < this.uncheckedAoi.length ; i++){
                if(this.uncheckedAoi[i]===valToRemove){
                    console.log('value matched==='+this.uncheckedAoi[i]);
                    this.uncheckedAoi.splice(i,1);
                    i--;
                }
            }

        }
        if(!event.target.checked){
            console.log('unchecked event.target.value'+event.target.value)
            this.uncheckedAoi.push(event.target.value);
            //this.checkedAoi.pop(event.target.value);
             //this.checkedAoi.splice(this.checkedAoi.indexOf(event.target.value),1);
            let valToRemove = event.target.value;
            for(let i = 0 ; i < this.checkedAoi.length ; i++){
                if(this.checkedAoi[i]===valToRemove){
                    this.checkedAoi.splice(i,1);
                    i--;
                }
            }
        }
            
        
        console.log('this.checkedAoi==='+this.checkedAoi);
        console.log('this.uncheckedAoi==='+this.uncheckedAoi);
    }
    handleMouseOver(event){
        let aoi = event.target.value;
        for(var i = 0 ; i < this.recordData.length ; i++){
            if(this.recordData[i].aoiValue==aoi){
                console.log('on mouse over'+aoi);
                if(this.recordData[i].disableCheckbox){
                    this.displayPopOver=true;
                }
            }
        }

        
    }
    handleMouseOut(){
        this.displayPopOver=false;
    }    
    handleSave(){
        if(this.uncheckedAoi || this.checkedAoi){
            console.log('save method clicked');
            saveAoi({
                checked : this.checkedAoi,
                unchecked: this.uncheckedAoi
            })
                .then(result =>{
                    this.savedString = result;
                })
                .catch(error =>{
                    this.saveerror = error;
                });
        }
    }

}