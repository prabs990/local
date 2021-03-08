import { LightningElement } from 'lwc';

export default class LifeCycleHooks extends LightningElement {
    constructor(){
        super();
        alert('I am in contructor');
    }
    connectedCallback(){
        alert('I am in connected callBack');
    }
    disconnectedCallback(){
        alert('I am in diconnected callback');
    }
    renderedCallback(){
        alert('I am in rendered callback');
    }
    errorCallback(error,stack){
        alert('I am in error');
    }
}