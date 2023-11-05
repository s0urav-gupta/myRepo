import { LightningElement, api } from 'lwc';
import updateTodo from "@salesforce/apex/ToDoController.updateTodo";
import deleteTodo from "@salesforce/apex/ToDoController.deleteTodo";

export default class ToDoItem extends LightningElement {
    @api todoId;
    @api todoName;
    @api done = false;

    updateHandler(){
        const todo = {
            todoId : this.todoId,
            todoName : this.todoName,
            todoDone : !this.done
        };
        
        updateTodo({payload: JSON.stringify(todo)}).then(result => {
            console.log("Item updated successfully");
            const updateEvent = new CustomEvent('update');
            this.dispatchEvent(updateEvent);
        }).catch(error => {
            console.log("Error : "+error);
        });
    }

    deleteHandler(){
        deleteTodo({todoId: this.todoId}).then(result => {
            console.log("Item deleted successfully");
            const deleteEvent = new CustomEvent('delete');
            this.dispatchEvent(deleteEvent);
        }).catch(error => {
            console.log("Error : "+error);
        });
    }

    get containerClass(){
        return this.done ? "todo completed" : "todo upcoming";
    }

    get iconName(){
        return this.done ? "utility:check" : "utility:add";
    }
}