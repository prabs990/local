import { LightningElement, wire, track } from 'lwc';
import  getProjects  from '@salesforce/apex/projectListController.getProjects';

export default class ProjectList extends LightningElement {

    @track projectRecords;
    @track error;

    
    @wire(getProjects)
    wiredProjectData({data,error}){
        if(data){
            console.log('this.projectRecords'+data);
            this.projectRecords = data;
            this.error = undefined;
        }
        if(error){
            console.log('this.error'+JSON.stringify(this.error));
            this.projectRecords = undefined;
            this.error = error;            
        }
        
    }

}