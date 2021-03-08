import { LightningElement, track } from 'lwc';

export default class PaginationChild extends LightningElement {
    
    handleNext(){
        const testMessage = 'This is next';
        const nextElement = new CustomEvent('next',
        { 
            detail : testMessage
        });
        this.dispatchEvent(nextElement);
        console.log('Next event fired');
    }
    handlePrevious(){
        const testMessage = 'This is prev';
        const prevElement = new CustomEvent('previous',
        {
            detail : testMessage
        });
        this.dispatchEvent(prevElement);
        console.log('previous element fored');
    }
}