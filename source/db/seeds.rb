require 'faker'

9.times { Task.create({description: Faker::Company.bs, complete: [true, false].sample}) }
