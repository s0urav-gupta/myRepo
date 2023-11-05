trigger CreateTaskonAccount on Account (before update) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            CreateTaskonAccountHandler.createTask(Trigger.new, Trigger.oldMap);
        }
    }
}