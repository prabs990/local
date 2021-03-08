import { LightningElement, wire, api, track } from 'lwc';
import getCandidateRecords from '@salesforce/apex/candidateListController.getCandidateRecords';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

export default class CandidateList extends LightningElement {

    @api candidateRecords;
    @api error;
    @wire(CurrentPageReference) pageRef;
    @api project='Fonteva';
    @api sortdirectionvalue='ASC';
    @api clientid=null;

    @wire(getCandidateRecords,{
        project : '$project',
        sortorder : '$sortdirectionvalue',
        client : '$clientid'
    })
    wiredCandidates({data,error}){
        if(data){
            console.log('data returned from candidate class'+JSON.stringify(data));
            this.candidateRecords = data;
            this.error = undefined;
        }
        if(error){
            console.log('error'+JSON.stringify(error));
            this.candidateRecords = undefined;
            this.error = error;
        }
    }

    connectedCallback(){
        registerListener("projectname", this.sutUpDetails, this);
        registerListener("sortdirection", this.sortdetail, this);
        registerListener("filterbyclient", this.clientfilter, this);
    }
    disconnectedCallback() {
        unregisterAllListeners(this);
    }
    sutUpDetails(dogDtl){
        console.log('sutUpDetails subscribe event==='+dogDtl);
        this.project = dogDtl;
    }
    sortdetail(sortdirectionvalue){
        console.log('sort direction in candidate list'+sortdirectionvalue);
        this.sortdirectionvalue = sortdirectionvalue;
    }
    clientfilter(clientid){
        console.log('client id received in candidate list==='+clientid);
        if(clientid){
            this.clientid = clientid;
        }
        
        if(clientid==undefined){
           this.clientid=null;   
        }
    }


}