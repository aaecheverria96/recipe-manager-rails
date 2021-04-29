# Rails Recipe Manager Project 

# Goal 
Create a Recipe Manager application that allows users to create, edit and share their own food recipes. Users can only delete and edit their own recipes. Also once they create a recipe it is immediately affiliated with that specific user. A user should be able to log in with their google account also. 

# Tables 
This project must have 6 tables - comments, ingredients, recipe-ingredients, recipes, user-recipes and users. 

- Comments should have a user_id, recipe_id and a text 

- Ingredients should have a name 

- Recipe-ingredients should be a joint table between recipes and ingredients. Should have quanitity 

- User-recipes should be the joint table between users and recipes 

- Users should have a username, email, passowrd_digest, provider, and uid



