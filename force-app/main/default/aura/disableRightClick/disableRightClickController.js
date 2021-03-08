({
    doinit : function(component,event,helper){
        alert('pae load');
          window.onload = function() {
/*    	    document.addEventListener("contextmenu", function(e){
//                console.log('inside right click');
                if(e.which==3)  {
//                	e.preventDefault();        
                }
             	
            }, false);
*/
          }              
          console.log('activated');
    },
    disableClick1 : function(component, event, helper) {
document.onmousedown = disableRightclick;
var message = "Right click not allowed !!";
function disableRightclick(evt){
    if(evt.button == 2){
        alert(message);
        return false;    
    }
}
	},
    disableClick2 : function(component, event, helper) {
		//document.addEventListener('contextmenu', event => event.preventDefault());
        //alert('hi');
        //console.log('1');
  	    /*document.addEventListener("contextmenu", function(e){
            console.log('inside right click');
          	e.preventDefault();    
        }, false);*/
        console.log('event.target.label'+event.target.label);
//		event.getSource().set("v.disabled", true);
        window.open('https://www.google.com');
	},
    disableClick3 : function(component, event, helper) {
		//document.addEventListener('contextmenu', event => event.preventDefault());
        //alert('hi');
        //console.log('1');

//        window.open('https://www.google.com');
	},    
})