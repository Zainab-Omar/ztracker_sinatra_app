 (X)Use Sinatra to build the app
    Yes, I used gems 'sinatra', 'activerecord', and 'sinatra-activerecord
 (X)Use ActiveRecord for storing information in a database
 (X)Include more than one model class (e.g. User, Post, Category)
    Yes, I have user model and tracker model

 (X)Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Yes, my user model has many trackers

 (X)Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
   Yes, my tracker model belongs to user

 (X)Include user accounts with unique login attribute (username or email)
   user can signup with (username, email, password) and sign in with (email, password)

 (X)Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    my tracker controller has routes for create, reading, updating, and deleting trackers.
 (X)Ensure that users can't modify content created by other user.
 (X)Include user input validations
 (X)BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
   I user errors.full_messages method and sinarta_flash.
 ()Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

 ()You have a large number of small Git commits
 ()Your commit messages are meaningful
 ()You made the changes in a commit that relate to the commit message
 ()You don't include changes in a commit that aren't related to the commit message