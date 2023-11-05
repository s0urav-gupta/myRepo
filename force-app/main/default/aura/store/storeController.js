({
	doInit : function(component, event, helper) {
		var action = component.get('c.getFish');
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var returnValue = response.getReturnValue();
                component.set( 'v.fish', returnValue);
                
                console.log(returnValue);
            }
	}); 
        $A.enqueueAction(action);
},
    
    handleSearch : function(component, event, helper) {
		var sText = component.get('v.sText');
    	var action = component.get('c.search');
    	action.setParams({
            searchFish : sText
		});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var returnValue = response.getReturnValue();
                component.set( 'v.fish', returnValue);
            }
	}); 
        $A.enqueueAction(action);
    }
})