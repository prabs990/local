import { ShowToastEvent } from 'lightning/platformShowToastEvent'
const showToast = () =>{
    const event = new ShowToastEvent({
        title: 'Get Help',
        message: 'Salesforce documentation is available in the app. Click ? in the upper-right corner.',
    });
    return event;
    
}
const showAlert = ()=>{
    alert('inside custom alert');
}
const getTerms = ()=>{
    return [
        {label : '20 years' , value : 20},
        {label : '25 years' , value : 25},
        {label : '30 years' , value : 30},
        {label : '35 years' , value : 30},
        {label : '40 years' , value : 40},

    ];
}
const computeInterest = (principal,rate,term) =>{
    let interest = (principal * rate * term )/100;
    return interest;
}
export {showToast,showAlert,getTerms,computeInterest};