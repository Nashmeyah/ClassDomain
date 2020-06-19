# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#---create users
User.create(username: 'Tom', email: 'tom@mail.com', password: '123', admin: false)
User.create(username: 'Lisa', email: 'lisa@mail.com', password: '123' ,admin: false)
User.create(username: 'Nash', email: 'nash@mail.com', password: '123', admin: false)



#---create categories 
Category.create(name: "Math")
Category.create(name: "English")
Category.create(name: "Social Studies")
Category.create(name: "Art")
Category.create(name: "Physical Ed")
Category.create(name: "History")

#---create courses
Course.create(name: "Algebra", description: "Beginners Algebra", category_id: 1)
Course.create(name: "Math 101", description: "Math Basics", category_id: 1)
Course.create(name: "Calc", description: "finding and properties of derivatives and integrals of functions", category_id: 1)
Course.create(name: "English 101", description: "Beginners english", category_id: 2)
Course.create(name: "Literal Art", description: "Learning about historical english literature", category_id: 3)
Course.create(name: "Art Basics 101", description: "Beginners guide to shading techniques", category_id: 4)
Course.create(name: "Basketball", description: "Spring Basketball", category_id: 5)
Course.create(name: "WW1", description: "3 week course on the history of WW1", category_id: 6)

Userscourse.create(course_id: 6, user_id: 1)




