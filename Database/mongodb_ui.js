db.employees.find({age:{$gt:20}}, {user_id:1,_id:0})

db.employees.find({age:{$gt:25},status:'A'})

db.employees.find({age:{$lt:60}}, {user_id:1,age:1})