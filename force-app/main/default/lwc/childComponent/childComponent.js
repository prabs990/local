import { LightningElement,track,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @track displayString;
    @api componentLabel;
    handleClick(){
  //      this.displayString = "Button Clicked @ " + (new Date()).toTimeString();
    }
    
    handleChange(event){
        this.displayString = event.target.value;
    }
}