import { LightningElement,track} from 'lwc';

export default class TestParent extends LightningElement {
    @track count= 5;
    @track str;
    handleprevious(event){
        this.count = this.count - 1;
        this.str = event.detail;
    }
    handlenext(){
        this.count = this.count + 1;
    }
}