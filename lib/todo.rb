class Todo < ActiveRecord::Base
  def to_s
    "#{self.id}. #{self.name} is: #{self.done==nil?? 'done' : 'undone'}"
  end
end