({
	validatePassword : function(component,event,helper) {
		var inputcmp = component.find("userPassword");
        var value = inputcmp.get("v.value");
        if(value==undefined){
            inputcmp.set("v.errors",[{message:"You must enter password"}]);
        }else if(value.length<7){
            inputcmp.set("v.errors",[{message:"password must be 7 characters"}])
        }else{
            inputcmp.set("v.errors",null);
        }
	}
})