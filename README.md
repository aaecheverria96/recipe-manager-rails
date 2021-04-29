# Rails Recipe Manager Project 
This Recipe Manager application allows users to create, edit and share their own food recipes. Users can only delete and edit their own recipes. Also once they create a recipe it is immediately affiliated with that specific user. A user should be able to log in with their google account also. Once a recipe is created it is also added to the index for all users to see; users may comment on other users' recipes. 

# Architecture and Models 
The Recipe model should belong to Users and that will be the core to having a recipe affiliated with a user. The comments model should have a recipe_id and a user_id.

For Recipes there should be a show page, edit page, create page (create and edit should have partial forms), an index page and a new page. Both the create and edit page must display errors. In addition, a comment cannot be submitted blank. 

# Development 
Create the app and get it started by running 'rails s'. Omniauth should be used to create the 'Sign in with Google' functionality during the login/signup process. 











