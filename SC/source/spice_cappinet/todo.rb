require_relative './config/application'
# require_relative 'app/models/task'

#puts "Put your application code in #{File.expand_path(__FILE__)}"

case ARGV[0]
when 'add'
  # add the rest of argv as a task to @list
  Task.create(description: "#{ARGV[1..-1].join(' ')}")

when 'list'
  # print out a pretty version of all the tasks in @list
  Task.all.each do |task|
    puts "#{task.id}. [#{task.complete ? "X" : " "}] #{task.description}"
  end
when 'delete'
  # delete @task number <argv.last>
  Task.destroy(ARGV.last)
when 'complete'
  # toggle @complete status on @task number <argv.last>
  Task.find(ARGV.last).update_attribute(:complete, true)

else
  puts "Unsupported command."
end
