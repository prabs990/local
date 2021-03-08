import { LightningElement } from 'lwc';

export default class TestChild extends LightningElement {
    handlePrevious(event){
        event.preventDefault();
        const prevus = new CustomEvent('previousevent',{detail : 'yes'});
        this.dispatchEvent(prevus);
    }
    handleNext(event){
        event.preventDefault();
        const nextus = new CustomEvent('nextevent');
        this.dispatchEvent(nextus);
    }
}