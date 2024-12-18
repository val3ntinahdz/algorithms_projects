require_relative 'task_scheduler'

class Router 
    def initialize
        @task_scheduler = TaskScheduler.new
        @running = true
    end

    def run 
    end
    
    def start 
        puts "--------- Your tasks ----------"
        puts "-------------------------------"
    
        while @running 
            display_menu
            choice = gets.chomp.to_i
            route_choice(choice)
        end
    end 

    def display_menu
        puts "1 - Add Task"
        puts "2 - Update Task"
        puts "3 - Remove Task"
        puts "4 - Display Tasks"
        puts "5 - Exit"
        print "Choose an option: " 
    end


    private 

    def route_choice(choice)
        case choice
        when 1 
            print "Enter Task ID: "
            id = gets.chomp.to_i
            print "Enter Task Name: "
            name = gets.chomp
            print "Enter Priority (Low/Medium/High): "
            priority = gets.chomp
            print "Enter Due Date (YYYY-MM-DD): "
            due_date = gets.chomp
            print "Enter Status (Pending/Completed): "
            status = gets.chomp
            @task_scheduler.add_task(id, name, priority, due_date, status)
            puts "Task added successfully!"
        when 2 
            @task_scheduler.update
        when 3
            @task_scheduler.delete_task
        when 4 
            @task_scheduler.show_tasks
        when 5 
            stop
        else 
            puts "Invalid Option! please try again!"
        end 
    end 

    def stop
        @running = false 
        puts "Goodbye!"
    end
end

if __FILE__ == $0
    router = Router.new
    router.start
end  