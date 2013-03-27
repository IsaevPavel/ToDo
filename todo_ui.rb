require 'active_record'
require './lib/todo'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

puts "Welcome to awesome ToDo list!"
def main
  def prompt text
    puts text
    gets.chomp
  end
  choice=nil
  until choice=='exit'
    choice=prompt "Press 'a' to add tasks, 'l' to list all, 'e' to edit, 'm' to mark done, or 'd' to delete"
    case choice
      when 'a'
        add
      when 'l'
        list
      when 'e'
        edit
      when 'm'
        mark_done
      when 'd'
        delete
      else
        "Incorrect value"
    end
  end
end
def add
  task=prompt "Input task"
  new_task=Todo.new(:name => task, :done => nil)
  new_task.save
end
def list
  Todo.all.each do |task|
    puts task
  end
end
def edit
  list
  id=prompt "Press number to edit"
  edit=prompt "Input change"
  find_id=Todo.find(id)
  find_id.update_attributes(:name => edit)
end
def mark_done
  list
  mark=prompt("Press number to mark is done").to_i
  done=Todo.find(mark)
  done.update_attributes(:done => 'done')
end
def delete
  list
  del=prompt "Press number to delete"
  task=Todo.find(del)
  task.delete
end
main