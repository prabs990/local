import { LightningElement, track } from 'lwc';
import { showToast,showAlert,getTerms,computeInterest } from 'c/utilEs6';

export default class ComputeInterest extends LightningElement {
    @track principal;
    @track rate;
    @track term;
    @track interest;
    terms = getTerms();
    handlePrincipal(event){
        this.principal = event.target.value;
    }
    handleTerm(event){
        this.term = parseInt(event.target.value,10);
    }
    handleRate(event){
        this.rate = event.target.value;
    }
    handleCompute(){
        showAlert();
        this.dispatchEvent(showToast());
        this.interest = computeInterest(this.principal,this.rate,this.term);
    }
}