# Web_Shop_Assignment
A college project for a Java Web Programming course. The web shop is built as a Java Web application, using GlassFishServer.

The project contains two folders.

The Database folder contains two .sql files containing queries required for the application to work properly.
The Database.sql file contains queries used to initilize the database used in the application.
The Procedures.sql file contains queries used to create stored procedures required for the application to work properly.

The WebShopAssignment folder contains code for the application.

The application was built using NetBeans IDE 8.2.
The database was built using Microsoft SQL Server Management Studio 18.

After launching the application, the user can register new accounts and use those accounts to purchase games from the webshop.
The user can also check their purchase history after making purchases.
A user cannot make any purchases before registering with an account.

After initializing the database using the Database.sql file, an admin user will also be automatically initialized.
The admin user can view purchase histories for all registered users.

Planned features and improvements:

- Create a login history for the admin to have an overview of all logins from registered users. It will contain details such as: date and time of login, user IP, username.
- Finish the purchase methods so there is more detail to them. Implement fake paypal purchases using developer paypal sandbox accounts.
- Add filtering options for games.
- Add more categories with more details.
- Create a „Forbidden access“ page for when users try to access pages they do not have permission to enter.
- Fix the startup page so the project launches at home page.
- Clean up any unneccessary or bad code.
- Fix bugs and smaller issues.

Preview of the web shop (as you can see it is heavily inspired by cyberpunk themes):

![Homescreen](https://github.com/mcervel/Web_Shop_Assignment/blob/master/Images/home_screen.png)

![PS4Games](https://github.com/mcervel/Web_Shop_Assignment/blob/master/Images/ps4_games.png)

![Game](https://github.com/mcervel/Web_Shop_Assignment/blob/master/Images/game_purchase.png)

![Cart](https://github.com/mcervel/Web_Shop_Assignment/blob/master/Images/cart.png)

![Login](https://github.com/mcervel/Web_Shop_Assignment/blob/master/Images/login.png)
