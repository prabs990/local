import { LightningElement, wire, track } from 'lwc';
import testString from '@salesforce/apex/apexIfElse.testString';
import getMap from '@salesforce/apex/apexIfElse.getMap';
export default class IfElse extends LightningElement {

    @track mapValues;
    //@wire(testString) records;
     /* eslint-disable no-console */
    /* eslint-disable no-alert */
    /*wiredData({error,data}){
        if(error){
           console.log('not valid'); 
        }
        if(data){
            console.log('valid');
        }
    }*/
    handleClick(){
       testString().then(result=>{
        console.log('result is'+result); 
        
       })
       .catch(error=>{
        console.log('errorsss');
        console.log(error.details.data.message);
       });

    }
    handleMethod2(){
        getMap().then(result=>{
            console.log("results are"+JSON.stringify(result));
            const options = [];
            for(let key in result){
                if(key){
                    options.push({
                        key : key,
                        value: result[key]
                    });
                }
            }
            this.mapValues = options;
        })
        .catch(error=>{
            console.log(error.details.data.message);
        });
    }
    
    
    
}