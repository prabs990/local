import { LightningElement, track, api } from 'lwc';
import headerImage from '@salesforce/resourceUrl/teamPic';
import FontevaLogo from '@salesforce/resourceUrl/FontevaLogo';
import banner from '@salesforce/resourceUrl/banner';

export default class Rsystemlogo extends LightningElement {

    @track displayImage1;
    @track displayImage2;
    @track displayImage3;

    connectedCallback(){
        //this.displayImage1 = headerImage + '/teampic/trailhead.jpg';
        //this.displayImage1 = FontevaLogo;
        this.displayImage1 = banner;
        this.displayImage2 = headerImage + '/teampic/Prabhjit.jpg';
        this.displayImage3 = headerImage + '/teampic/Pratik.jpg';
        //this.template.querySelector('div').classList.remove('slds-carousel__image');

    }
    
        //Call one function from another        
        //setTimeout(this.changeImage,5000); 
        
    }
/*    changeImage(){
        console.log('0===');
        if(headerImage){
            console.log('line1===');
            var imageList = headerImage + '/teampic/trailhead.jpg';
            console.log('line2===');
            this.displayImage = imageList;
    
        }
    }
*/