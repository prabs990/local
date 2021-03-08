import { LightningElement } from 'lwc';
import { NavigationMixin} from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class PageReferenceDemo extends NavigationMixin(LightningElement) {
    navigateToList(){
        let pagereference = {
            type : 'standard__objectPage' ,
            attributes : {
                actionName : 'list',
                objectApiName : 'Account'
            },
            state:{
                filterName : '00B6F00000Az6D4UAJ'
            }
        };
        this[NavigationMixin.Navigate](pagereference,true);
    }
    navigateToRecord(){
        let pagereference = {
            type: 'standard__recordPage',
            attributes : {
                actionName : 'view',
                recordId : '0016F00002DdwkXQAR',
                objectApiName : 'Account'
            },
            state:{

            }
        };
        this[NavigationMixin.Navigate](pagereference,true);
    }
    navigateToObjectHome(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes : {
                objectApiName : 'Case',
                actionName : 'home'
            }
        });
    }
    navigateToNewRecordPage(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes : {
                objectApiName : 'Account',
                actionName : 'new'
            }
        });
    }
    navigateToRelatedList(){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordRelationshipPage',
            attributes:{
                recordId : '0016F00002DdwkXQAR',
                objectApiName : 'Account',
                relationshipApiName : 'Contacts',
                actionName : 'view'
            }
        });
    }
    navigateToTabPage(){
        alert('tab page');
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes:{
                apiName : 'Accounts'
            }
        });
    }
    showToast(){
        alert('show toast');
        const event = new ShowToastEvent({
            title : 'Get Help',
            variant:'success',
            mode:'sticky',
            message:'SFDC toast message'
        });
        this.dispatchEvent(event);
    }
}