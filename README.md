# Rails Recipe Manager Project 
This Recipe Manager application allows users to create, edit and share their own food recipes. They can sign in by either creating a profile or logging in using their Google accounts. When logging in, they should be taken directly to the Recipes#index page.  Users can only delete and edit their own recipes. Also once they create a recipe it is immediately affiliated with that specific user. A user should be able to log in with their google account also. Once a recipe is created it is also added to the index for all users to see; users may comment on other users' recipes. There should be a navbar at the top of every page with four options - Home (which is the index page), logout, My Recipes and Create. 

Right below the navbar there should be the search functionality, one can search for any recipes using a word or letter. Underneath that, there is a list of recipes that are in alphabetical order; it does not matter how recently they were created. 

# Architecture and Models 
The Recipe model should belong to Users and that will be the core to having a recipe affiliated with a user. The comments model should have a recipe_id and a user_id.

For Recipes there should be a show page, edit page, create page (create and edit should have partial forms), an index page and a new page. Both the create and edit page must display errors. In addition, a comment cannot be submitted blank. When a form is not filled out correctly, there should be errors describing to the user what has gone wrong and why. For example, when creating a recipe someone forgets to give the recipe a name and description; that recipe should not be able to be submitted.

The forms for the create and edit/update should be a partial, since they are very similar. Create a _form.erb.html and then render the form in each view. On the showpage, the edit link and destroy button should only be visible if that recipe belongs to the user. If not, they should not be there.   


# Development 
Create the app and get it started by running 'rails s'. Omniauth should be used to create the 'Sign in with Google' functionality during the login/signup process. 












