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
        puts " "
        puts "What do you want to do next?"
        puts "1 - Add Task"
        puts "2 - Update Task"
        puts "3 - Remove Task"
        puts "4 - Display Tasks"
        puts "5 - Exit"
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
            print "Enter Task ID to update:"
            id = gets.chomp.to_i
            updates = {}
            print "Update Name (leave blank to skip): "
            name = gets.chomp
            updates[:name] = name unless name.empty?
            print "Update Priority (leave blank to skip): "
            priority = gets.chomp
            updates[:priority] = priority unless priority.empty?
            print "Update Due Date (leave blank to skip): "
            due_date = gets.chomp
            updates[:due_date] = due_date unless due_date.empty?
            print "Update Status (leave blank to skip): "
            status = gets.chomp
            updates[:status] = status unless status.empty?
            @task_scheduler.update(id, updates)
            puts "Task updated successfully!"
            # @task_scheduler.update
        when 3
            print "Enter Task ID to remove:"
            id = gets.chomp.to_i
            @task_scheduler.delete_task(id)
            puts "Task removed succesfully!"
        when 4 
            if @task_scheduler.tasks.head.nil?
                puts "No task found"
            else 
                print "All the tasks"
                puts "       "
                @task_scheduler.show_tasks
            end
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