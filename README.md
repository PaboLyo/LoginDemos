# Login Application using Java

## Overview
This web application is built using Java and follows the MVC (Model-View-Controller) architecture. It provides features for user authentication, error handling, and restricted page access based on user roles.

## Features
### Login Page (login.jsp)
- Allows users to enter their credentials (username and password) to log in.
- Sends form data to the LoginServlet for authentication.
- Supports English and Chinese language options. (Hardcoded)

### Authentication
- The LoginServlet authenticates user credentials against a predefined set of users.
- Sets a session attribute (authenticated) upon successful login.
- Redirects users to the error.jsp page if authentication fails.

### Error Page (error.jsp)
- Displays an error message if users attempt to access restricted pages without proper authentication.
- Provides a link to the login page for users to log in with appropriate credentials.


### Restricted Page (restricted.jsp)
- Displays restricted content only to users with appropriate authentication.
- Includes a logout button that sends a logout request to the LogoutServlet.

### Logout
- The LogoutServlet handles logout requests by invalidating the current session.
- Redirects users to the login page after logout.

## Model View Controller (Overview)
Model -> User

View -> JSP pages in webapp ('login.jsp', 'welcome.jsp', 'restricted.jsp', 'error.jsp')

Controller -> LoginServlet, LogoutServlet

## Setup Instructions
To run the web application locally, follow these steps:

1. Clone the repository to your local machine.
2. Set up a Java web server (e.g., Apache Tomcat) and configure it to deploy the application.
3. Import the project into your preferred IDE (e.g., Eclipse).
4. Download SQLite Database Connector and place the files in your Apache Tomcat (https://github.com/xerial/sqlite-jdbc)
5. Modify the database location to your folder location under "SQLiteConnection.java" in "dao" folder.
6. Start the server and run "Login.jsp"

## Technologies Used
- Java Servlets
- JavaServer Pages (JSP)
- HTML
- MVC Architecture
- SQLite Database
- Apache Tomcat 9.071

## Database (Overview)
![image](https://github.com/PaboLyo/LoginDemos/assets/28751228/135464a9-c164-47d9-b51a-f32c7592ae3f)

