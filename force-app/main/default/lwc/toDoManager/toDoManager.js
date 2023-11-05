import { LightningElement, track } from 'lwc';
import addTodo from "@salesforce/apex/ToDoController.addTodo";
import getCurrentTodos from "@salesforce/apex/ToDoController.getCurrentTodos";

export default class ToDoManager extends LightningElement {
    time;
    greeting;
    @track todos = [];
    connectedCallback(){
        this.getTime();
        //this.populateTodos();
        this.fetchTodo();
        setInterval(() => {
            this.getTime();
        }, 1000 * 60);
    }

    getTime(){
        const date = new Date();
        const hour = date.getHours();
        const min = date.getMinutes();
        //const sec = date.getSeconds();

        //this.time = `${this.getHour(hour)}:${this.getDoubleDigit(min)} ${this.getMidDay(hour)}`;
        this.time = this.getHour(hour)+':'+this.getDoubleDigit(min)+' '+this.getMidDay(hour);
        this.setGreeting(hour);
    }

    getHour(hour){
        return hour === 0 ? 12 : hour > 12 ? (hour-12) : hour;
    }

    getMidDay(hour){
        return hour >= 12 ? "PM" : "AM";
    }

    getDoubleDigit(digit){
        return digit < 10 ? "0"+digit : digit;
    }

    setGreeting(hour){
        if(hour < 12){
            this.greeting = "Good Morning";
        } else if(hour >= 12 && hour < 17){
            this.greeting = "Good Afternoon";
        } else {
            this.greeting = "Good Evening";
        }
    }

    addTodoHandler(){
        var i;
        const inputBox = this.template.querySelector("lightning-input");
        const todo = {
            todoName: inputBox.value,
            todoDone: false,
        };

        addTodo({ payload: JSON.stringify(todo)})
        .then(response => {
            console.log("Item inserted successfully");
            this.fetchTodo();
        }).catch(error => {
            console.log("Error : "+error);
        });
        //this.todos.push(todo);
        
        inputBox.value = "";
    }

    fetchTodo(){
        getCurrentTodos().then(result =>{
            if(result){
                console.log("Result : "+result.length);
                this.todos = result;    
            }
        }).catch(error => {
            console.log("Error : "+error);
        });
    }

    updateHandler(){
        this.fetchTodo();
    }

    deleteHandler(){
        this.fetchTodo();
    }

    get upcomingTask(){
        return this.todos && this.todos.length ? this.todos.filter(todo => !todo.todoDone) : [];
    }

    get completedTask(){
        return this.todos && this.todos.length ? this.todos.filter(todo => todo.todoDone) : [];
    }

    /*populateTodos(){
        const todos = [
            {
                todoId: 0,
                todoName: "Generate API",
                todoDone: false,
                todoDate: new Date()
            },
            {
                todoId: 1,
                todoName: "Buy groceries",
                todoDone: false,
                todoDate: new Date()
            },
            {
                todoId: 2,
                todoName: "Email to the team",
                todoDone: true,
                todoDate: new Date()
            },
            {
                todoId: 3,
                todoName: "Do Excercise",
                todoDone: false,
                todoDate: new Date()
            },
            {
                todoId: 4,
                todoName: "Solve the cube",
                todoDone: true,
                todoDate: new Date()
            }
        ];
        this.todos = todos;
    }*/
}