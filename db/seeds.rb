# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "************Deleting Previous Roles************"
roles = Role.all
roles.each { |role| role.destroy } if roles.present?
#
puts "************Adding New Roles************"
%w(admin attendee programmer).each do |name|
  Role.create(:title => name)
end
puts "************Roles Are Successfully Created************"
puts "......................................................"
puts "************Deleting Existing Users************"
users = User.all
users.each { |user| user.destroy } if users.present?
puts "************Adding User Super Admin************"
#Role.create(:title => "super_admin")
user = User.create!(:email => "admin", :password => "1234")
role = Role.where(:title => "admin").first
user.roles << role
user1 = User.create!(:email => "programmer", :password => "1234")
role1 = Role.where(:title => "programmer").first
user1.roles << role1
puts "************Super Admin Successfully Created************"
puts "......................................................"