import { LightningElement, track } from 'lwc';
import {loadStyle} from 'lightning/platformResourceLoader';
import staticresource from '@salesforce/resourceUrl/staticresource';
//import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ThirdPartyResource extends LightningElement {
    @track successMessage ='';
    @track error;
    @track fImage;
    
    connectedCallback(){
        this.fImage = staticresource + '/resource/Image/t2.jpg';
        console.log('fImage==='+this.fImage);
        console.log('this.staticresource==='+this.staticresource);
    }
    renderedCallback(){
        Promise.all([
            loadStyle(this,staticresource + '/resource/css/customimg.css')
        ])
        .then(()=>{
            console.log('entering success');
            this.error = undefined;
            this.showSuccessMessage();
        })
        .catch(error=>{
            this.error = error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Error!',
                    message:'this error',
                    variant:'error',    
                }),
            );
        });
        
    }
    showSuccessMessage(){
        console.log('succ message fn');
        this.successMessage = 'CSS loaded';
        alert('Successfull');
    }
}