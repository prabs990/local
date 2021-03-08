import { LightningElement, track } from 'lwc';

export default class ProductOpportunities extends LightningElement {
    @track productsToDisplay;

    handleRequiredProducts(event){
        console.log('required products are from event'+JSON.stringify(event.detail));
        if(this.productsToDisplay){
            console.log('first');
//            this.productsToDisplay.push(event.detail);
            var newlist = this.productsToDisplay.concat(event.detail);
            console.log('newlist'+JSON.stringify(newlist));
            this.productsToDisplay = newlist;
        }else{
            console.log('second');
            this.productsToDisplay = event.detail;
        }        
    }

    handleOptionalProducts(event){
//fix these one, two third and fourth tomorrow.        
        console.log('optional elements in productOpp are from event'+JSON.stringify(event.detail));
        if(this.productsToDisplay){
            console.log('third');
            var newlist = this.productsToDisplay.concat(event.detail);
            console.log('newlist'+JSON.stringify(newlist));
            this.productsToDisplay = newlist;
        }else{
            console.log('fourth');
            this.productsToDisplay = event.detail;
        }        
    }
    
}