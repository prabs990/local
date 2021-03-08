import { LightningElement, track } from 'lwc';
import getOptionProductList from '@salesforce/apex/productselectioncontroller.getOptionProductList';
export default class OptionalProducts extends LightningElement {
    @track optionalProducts;
    @track error;
    connectedCallback(){
        getOptionProductList()
        .then(result=>{
            
            this.optionalProducts = result
            this.error = undefined;

            let productsToDisplay =[];
            if(this.optionalProducts){
                for(let i = 0 ; i < this.optionalProducts.length ; i++){
                    productsToDisplay[i] = {
                        productname : this.optionalProducts[i].productname,
                        productid : this.optionalProducts[i].productid
                    };
                }
                if(productsToDisplay){
                    const optionalProducts = new CustomEvent('optionalproducts',{
                        detail: productsToDisplay
                    });
                    this.dispatchEvent(optionalProducts);
                }
            }
        })
        .catch(error=>{
            this.optionalProducts = undefined;
            this.error = error;
            JSON.stringify('error in optional product component'+JSON.stringify(this.error));
        });
    }
}