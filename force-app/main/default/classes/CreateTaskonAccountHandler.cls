public class CreateTaskonAccountHandler {
    public static void createTask(List<Account> newList, Map<Id, Account> oldMap){
        List<Task> tskList = new List<Task>();
        if(newList != null && oldMap != null){
            for(Account acc : newList){
                if(acc.Industry == 'Insurance' && oldMap.get(acc.Id).Industry == 'Finance'){
                    tskList.add(new Task(OwnerId = acc.OwnerId,
                                         Subject = 'Email',
                                         Priority = 'Normal',
                                         Status = 'Not Started',
                                         WhatId = acc.Id));
                }
            }
            if(!tskList.isEmpty()){
            	insert tskList;   
            }
        }
    }
}