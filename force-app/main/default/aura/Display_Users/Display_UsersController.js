({
	showUsers : function(component, event, helper){
    	var action = component.get("c.getUsers");
        action.setCallback(this, function(data){
    		component.set('v.userList', data.getReturnValue())
	});
		$A.enqueueAction(action);
	},
})