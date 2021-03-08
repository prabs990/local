({
	handleSubmit : function(component, event, helper) {
        console.log('hello');
		var fnumber = document.getElementsByName('fnumber')[0].value;
        var snumber = document.getElementById('snumber').value; 
        console.log(fnumber + '' +snumber);
        var sum = parseInt(parseInt(fnumber) + parseInt(snumber)); 
        console.log('sum'+sum);
        document.getElementById('answer').innerHTML = sum;
	},
    handleGoogle : function(component,event,helper){
        window.open('https://www.google.com','_blank');
    }
})