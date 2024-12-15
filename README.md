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
