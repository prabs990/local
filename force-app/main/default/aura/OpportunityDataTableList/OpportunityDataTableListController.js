({
	init : function(component, event, helper) {
		component.set('v.mycolumns',[
            {label:'Opportunity Name',fieldName:'opportunityName',type:'text'},
             {label:'Confidence',fieldName:'confidence',type:'percent',cellAttributes:
              {iconName:{fieldName:'trendIcon'},iconPosition:'right'}},
            {label:'Amount',fieldName:'amount',type:'currency',typeAttributes: { currencyCode: 'EUR'}},
            {label:'contact email',fieldName:'contact',type:'email'}
        ]);
        component.set("v.mydata",[
            {id:'a',
            opportunityName:'cloudhub1',
            confidence:0.2,
            amount:2500,
            contact:'test@test1.com',
            trendIcon:'utility:down'},
            {id:'b',
            opportunityName:'cloudhub2',
            confidence:0.2,
            amount:2500,
            contact:'test@test2.com',
            trendIcon:'utility:up'},
        ]);
	},
            getSelectedName:function(component,event,name){
             var selectedRows = event.getParam('selectedRows');
            for(var i = 0;i<selectedRows.length;i++){
            alert("You selcted"+selectedRows[i].opporunityName);
            }
            }
})