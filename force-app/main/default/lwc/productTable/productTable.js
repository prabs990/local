import { LightningElement, api, track, wire } from 'lwc';
import getRequiredProductList from '@salesforce/apex/productselectioncontroller.getRequiredProductList';
import saveProduct1 from '@salesforce/apex/productselectioncontroller.saveProduct1';
import fatchPickListValue from '@salesforce/apex/productselectioncontroller.fatchPickListValue';

export default class ProductTable extends LightningElement {
    @api recordId;// this will contain opportunity Id
    @api recordstodisplays;
    @track displayproducts;//wrapper-iteration happening on this
    @track errorSave;
    @track savedString;
    @track productrecords=[];// Data to save for OpportunityLineItem
    @track displayErrorMessage;

    @wire(fatchPickListValue, {objInfo: {'sobjectType' : 'Product2'},
                            picklistFieldApi: 'Family'}) stageNameValues;

    connectedCallback(){
        console.log('connected callback in producttable'+this.recordstodisplays);
        if(this.recordstodisplays){
            this.displayproducts = this.recordstodisplays;
            console.log('new required product is'+JSON.stringify(this.displayproducts));
    //load initially the product ids into productrecords   
            if(this.displayproducts){
                console.log('inside  if');
                for(let i = 0; i < this.displayproducts.length ; i++){
                    console.log('loading data01');
                    let cont = { 'sobjectType': 'OpportunityLineItem' };
                    cont.Product2Id = this.displayproducts[i].productid;
                    cont.OpportunityId = '0066F00000ny6xPQAQ';
                    cont.TotalPrice = 5000;                    
                    this.productrecords.push(cont);                    
                }
                console.log('Initial load of this product is==='+JSON.stringify(this.productrecords));
            }
        }
/*        getRequiredProductList()
            .then(result =>{
                console.log('required products from class =='+JSON.stringify(result));
                this.requiredproducts = result;
                this.error = undefined;
                console.log('required products from variable =='+JSON.stringify(this.requiredproducts));
                console.log('1 if');
//load initially the product ids into productrecords   
                if(this.requiredproducts){
                    console.log('inside  if');
                    for(let i = 0; i < this.requiredproducts.length ; i++){
                        console.log('loading data01');
                        let cont = { 'sobjectType': 'OpportunityLineItem' };
                        cont.Product2Id = this.requiredproducts[i].productid;
                        cont.OpportunityId = '0066F00000ny6xPQAQ';
                        cont.TotalPrice = 5000;                    
                        this.productrecords.push(cont);                    
                    }
                    console.log('Initial load of this product is==='+JSON.stringify(this.productrecords));
                }
            })
            .catch(error =>{
                this.requiredproducts = undefined;
                this.error = error;
                console.log('error in required products section==='+JSON.stringify(this.error));
            });
*/
    }

//below logic will be used to save mandatory products to DB    
    handleSave(){
        let productid = new Array();

        for(let i = 0 ; i < this.displayproducts.length ; i++){
            console.log('array of displayproducts ids'+JSON.stringify(this.displayproducts[i].productid));
            productid.push(this.displayproducts[i].productid);    
        
       }
       console.log('products ids are'+JSON.stringify(productid));
        
        saveProduct({
            mandatoryProductId : productid
        })
            .then(result =>{
                this.savedString = result;
                console.log('this.savedString==='+this.savedString);
            })
            .catch(error =>{
                this.errorSave = error;
                console.log('Save Method Failed'+JSON.stringify(this.errorSave));
            });        
    }
    handleQuantity(event){
        let quantity = event.target.value;
        console.log('quantity=='+quantity);
        console.log('product id=='+event.target.dataset.id);
//use this code to append values like quantity/Salesprice etc this.selectedRecord = this.records.find( record => record.Id === selectedRecordId);
       const selectedRecord = this.productrecords.find( record => record.Product2Id === event.target.dataset.id);

       if(selectedRecord){
            console.log('record found==='+selectedRecord);
            selectedRecord.Quantity = event.target.value;
        }
        if(!selectedRecord){
            console.log('record not found===');
            let cont = { 'sobjectType': 'OpportunityLineItem' };
            cont.Product2Id = event.target.dataset.id;
            cont.Quantity = event.target.value;
            cont.OpportunityId = '0066F00000ny6xPQAQ';
            cont.TotalPrice = 5000;
            this.productrecords.push(cont);    
        }
        
        console.log('this.productrecords for apex json==='+JSON.stringify(this.productrecords));
    }
    handlePrice(event){
        const selectedRecord = this.productrecords.find( record => record.Product2Id === event.target.dataset.id);

        if(selectedRecord){
             console.log('record found==='+selectedRecord);
             selectedRecord.UnitPrice = event.target.value;
         }
         if(!selectedRecord){
             console.log('record not found===');
             let cont = { 'sobjectType': 'OpportunityLineItem' };
             cont.Product2Id = event.target.dataset.id;
             cont.UnitPrice = event.target.value;
             cont.OpportunityId = '0066F00000ny6xPQAQ';
             cont.TotalPrice = 5000;
             this.productrecords.push(cont);    
         }
         console.log('this.productrecords for apex json==='+JSON.stringify(this.productrecords));
    }
    handleDate(event){
        const selectedRecord = this.productrecords.find( record => record.Product2Id === event.target.dataset.id);

        if(selectedRecord){
             console.log('record found==='+selectedRecord);
             selectedRecord.Date = event.target.value;
         }
         if(!selectedRecord){
             console.log('record not found===');
             let cont = { 'sobjectType': 'OpportunityLineItem' };
             cont.Product2Id = event.target.dataset.id;
             cont.Date = event.target.value;
             cont.OpportunityId = '0066F00000ny6xPQAQ';
             cont.TotalPrice = 5000;
             this.productrecords.push(cont);    
         }
         console.log('this.productrecords for apex json==='+JSON.stringify(this.productrecords));        
    }
    handlePicklist(event){
        const selectedRecord = this.productrecords.find( record => record.Product2Id === event.target.dataset.id);

        if(selectedRecord){
             console.log('record found==='+selectedRecord);
             selectedRecord.Family__c = event.target.value;
         }
         if(!selectedRecord){
             console.log('record not found===');
             let cont = { 'sobjectType': 'OpportunityLineItem' };
             cont.Product2Id = event.target.dataset.id;
             cont.Family__c = event.target.value;
             cont.OpportunityId = '0066F00000ny6xPQAQ';
             cont.TotalPrice = 5000;
             this.productrecords.push(cont);    
         }
         console.log('this.productrecords for apex json==='+JSON.stringify(this.productrecords));        
    }
    handleDelete(event){
        console.log('event.target.dataset.id==='+event.target.dataset.id);
        console.log('this.productrecords before'+JSON.stringify(this.productrecords));
//delete the records which are to save to DB
        for(let i = 0 ; i < this.productrecords.length ; i++){
            if(this.productrecords[i].Product2Id===event.target.dataset.id){
                this.productrecords.splice(i,1);
                i--;
            }
        }
        console.log('this.productrecords after delete'+JSON.stringify(this.productrecords));
        console.log('this.displayproducts before1=='+JSON.stringify(this.displayproducts));
//delete the records on which iteration is happening        
        for(let i = 0 ; i < this.displayproducts.length ; i++){
            if(this.displayproducts[i].productid===event.target.dataset.id){
                this.displayproducts.splice(i,1);
                i--;
            }
        }
        console.log('this.displayproducts after=='+JSON.stringify(this.displayproducts));
    }
    handleProductSave(){

        let showError=0;

        if(this.productrecords){
            console.log('entering first if');
            for(let i = 0 ; i < this.productrecords.length ;i++){
                console.log('this.productrecords[i]==='+JSON.stringify(this.productrecords[i]));
                if(!this.productrecords[i].Quantity || !this.productrecords[i].UnitPrice || !this.productrecords[i].Date || !this.productrecords[i].Family__c){
                    console.log('changing showerror');
                    showError = 1;
                }
            }
             if(showError===0){
                console.log('entering save0');
                saveProduct1({
                    products : this.productrecords
                })
                    .then(result =>{
                        this.savedString = result;
                    })
                    .catch(error =>{
                        this.errorSave = error;
                        console.log('Save Method Failed'+JSON.stringify(this.errorSave));
                    });
            }else{
                console.log('show error');
            }
        }
    }
}