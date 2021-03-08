import { LightningElement, track } from 'lwc';

export default class PaginationParent extends LightningElement {
    @track pageNumber = 1;

    handleNext(){
        this.pageNumber = this.pageNumber + 1;
    }
    handlePrevious(){
        if(this.pageNumber > 1){
            this.pageNumber = this.pageNumber - 1;
        }
        
    }
}