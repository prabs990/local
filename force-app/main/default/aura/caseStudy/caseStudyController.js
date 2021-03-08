({
    updateNickname: function(component, event, helper) {
        // Update the nickname field when 'tab' is pressed
        if (event.getParams().keyCode == 9) {
        	var nameInput = component.find("firstName");
        	var nameValue = nameInput.get("v.value");
        	var nickName = component.find("nickname");
            var today = new Date();
        	nickName.set("v.value", nameValue + today.valueOf(today));   
        }
    },
    saveUserForm: function(component,event,helper){
    var name = component.get("v.user.First__c");
    var last = component.get("v.user.Last__c");
    var password = component.get("v.user.Password__c");
    var nickname = component.get("v.user.Nickname__c");
    var email = component.get("v.user.Email__c");
    
    var passwordCmp = component.find("userPassword");
    var emailCmp = component.find("email");
     
    helper.validatePassword(component,event,helper);
//    helper.vaidateEmail(component,event,helper);
        if(passwordCmp.get("v.errors")==null){
            component.set("v.hasErrors",false);
        }else{
            component.set("v.hasErrors",true);
        }        
},
    cancel : function(component,event,helper){
        $A.get("e:force:closeQuickAction").fire();
    }
})