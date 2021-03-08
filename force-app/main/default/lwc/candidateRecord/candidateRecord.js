import { LightningElement, api, track } from 'lwc';
import FontevaLogo from '@salesforce/resourceUrl/FontevaLogo';
import servicetitan from '@salesforce/resourceUrl/servicetitanlogo';
import profilePic from '@salesforce/resourceUrl/selfPic';
import trailheadImage from '@salesforce/resourceUrl/trailheadImage';
import teamPic from '@salesforce/resourceUrl/teamPic';

export default class CandidateRecord extends LightningElement {
    @track fontevaLogo = FontevaLogo;
    @track profilePic = profilePic;
    @api recorddisplay;
    @track trailheadImage = trailheadImage;
    @track profilePicture;
    @api projecttype='Fonteva';
    
//read all images in one variabe?    
    connectedCallback(){
        console.log('value of record in child'+this.recorddisplay);
        this.profilePicture = teamPic + '/teampic/trailhead.jpg';
        if(this.recorddisplay){
            if(this.recorddisplay.First_Name__c=='Pulak'){
                this.profilePicture = teamPic + '/teampic/Pulak.jpg';
            }
            if(this.recorddisplay.First_Name__c=='Prabhjit'){
                this.profilePicture = teamPic + '/teampic/Prabhjit1.jpg';
            }
            if(this.recorddisplay.First_Name__c=='Pratik'){
                this.profilePicture = teamPic + '/teampic/Pratik.jpg';
            }
            if(this.recorddisplay.First_Name__c=='Abhishek'){
                this.profilePicture = teamPic + '/teampic/Abhishek.jpg';
            }
            if(this.recorddisplay.First_Name__c=='Sanjeev'){
                this.profilePicture = teamPic + '/teampic/Sanjeev.jpg';
            }
            if(this.recorddisplay.First_Name__c=='Vishal'){
                this.profilePicture = teamPic + '/teampic/Vishal.jpg';
            }
            this.star = teamPic + '/teampic/star.jpg';
            if(this.projecttype == 'Fonteva'){
                this.fontevaLogo = FontevaLogo;
            }
            if(this.projecttype=='Service Titan'){
                this.fontevaLogo = servicetitan;
            }
        }
    }
    get bandwidth() { 
        if(this.recorddisplay.Bandwidth__c==0){
            return 'slds-progress-bar__value slds-progress-bar__value_success bandwidth0';
        }
        if(this.recorddisplay.Bandwidth__c==25){
            return 'slds-progress-bar__value slds-progress-bar__value_success bandwidth25';
        }
        if(this.recorddisplay.Bandwidth__c==50){
            return 'slds-progress-bar__value slds-progress-bar__value_success bandwidth50';
        }
        if(this.recorddisplay.Bandwidth__c==75){
            return 'slds-progress-bar__value slds-progress-bar__value_success bandwidth75';
        }
        if(this.recorddisplay.Bandwidth__c==100){
            return 'slds-progress-bar__value slds-progress-bar__value_success bandwidth100';
        }

//        return this.recorddisplay.Bandwidth__c > 0 ? 'slds-progress-bar__value slds-progress-bar__value_success bandwidth25' : 'slds-progress-bar__value slds-progress-bar__value_success bandwidth75';
      }
    

}