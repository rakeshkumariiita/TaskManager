# README

Task Manager Application
Rails Authentication Used for Sign In and Sign Out with session management
Task list with pagination with crud operation like create, update, delete
Validations added for due_date and status change
Completed task are shown in green-yellow in show page with class css
Users can only see their created task and operate on that.
We can also extend these for more security depending on requirements
Things you may want to cover:

* Ruby version : 3.3.6, Rails Version : 8.0.1

* Database : Postgres 16(Make sure to change peer to md5 in hba config of postgres)
Make specific user and add those username/password in database.yml

* Add a User in User Table via Rails console (Following commands)
task-manager(dev)> user = User.new(:email_address => "temporary@temp.com")
=> #<User:0x00007f69eb7425a0 id: nil, email_address: "[FILTERED]", password_digest: nil, created_at: nil, updated_a...
task-manager(dev)> user.password = "Temp"
=> "Temp"
task-manager(dev)> user.password_confirmation = "Temp"
=> "Temp"
task-manager(dev)> user.save
  TRANSACTION (1.2ms)  BEGIN /*application='TaskManager'*/
  User Create (15.2ms)  INSERT INTO "users" ("email_address", "password_digest", "created_at", "updated_at") VALUES ('temporary@temp.com', '$2a$12$gMKzDVImdSP9HOe2aD42Pe/li3If1iXsuIpaed/uSwEpMHOtnibo2', '2024-12-15 15:39:18.984657', '2024-12-15 15:39:18.984657') RETURNING "id" /*application='TaskManager'*/
  TRANSACTION (2.4ms)  COMMIT /*application='TaskManager'*/
=> true
