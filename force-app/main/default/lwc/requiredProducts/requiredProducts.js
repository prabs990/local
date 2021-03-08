import { LightningElement, track } from 'lwc';
import getRequiredProductList from '@salesforce/apex/productselectioncontroller.getRequiredProductList';

export default class RequiredProducts extends LightningElement {
    @track requiredproducts;//wrapper-iteration happening on this
    @track error;

    connectedCallback(){
        getRequiredProductList()
            .then(result =>{
                this.requiredproducts = result;
                this.error = undefined;
                
                let productsToDisplay =[];
                for(let i = 0; i < this.requiredproducts.length ; i++){
                    productsToDisplay[i] = {
                        productname : this.requiredproducts[i].productname,
                        productid : this.requiredproducts[i].productid,
                    };    
                }
                
                if(productsToDisplay){
                    const sendRequiredProducts = new CustomEvent('requiredproducts',
                    {
                        detail: productsToDisplay
                    });
                    this.dispatchEvent(sendRequiredProducts);
                }
//show error message and handle that no required products found
            })
            .catch(error =>{
                this.requiredproducts = undefined;
                this.error = error;
                console.log('error in required products section1==='+JSON.stringify(this.error));
            });
    }

}