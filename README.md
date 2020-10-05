# Delilah Resto API by Laura Perez Bosio

REST API for a restaurant's online ordering system, made with node.js and express.
This is the 3rd and the last project of DWFS career at ACAMICA, the challenge of creating an API.

#### [Oficial API Documentation URL](https://documenter.getpostman.com/view/12758287/TVRd8AW6)

### Installation Requirements

-  Node.js: API compatible with version 14.13.0.
-  Server: You could use [XAAMP](https://www.apachefriends.org/es/index.html) to manage the server.
-  MySQL database engine: You can run the database with phpmyadmin through XAAMP. A database creation script named `delilah_resto.sql` is included in the Delilah resto folder with the database structure.

### Step by Step Installation

The following installations steps will be explained using XAAMP and phpmyadmin.

1. Download the files or clone the repository to a folder in your server using:  
   `git clone [https://github.com/LaliPerez/delilahRestoMaster]`

2. Open the command line in the folder where you saved the files and run
   `npm install` or `npm i`
Now package.json file will be available at your file.

3. Open XAAMP and start the Apache and MySQL services and wait for them to start.

![1](https://i.imgur.com/yCW8GW1.png)
![2](https://i.imgur.com/4W2eYuO.png)

4. Once the dependencies have been installed, go to [http://localhost/phpmyadmin/db_structure.php?server=1&db=delilah_resto] to open the PHPmyadmin administration site.we will import the database: `delilah_resto.sql` file to PHPmyAdmin [3](https://i.imgur.com/PSV0lsy.png).
As you open it, you´ll be able to see the tables that were created, with example data in there.

5. If you choose to use a different database or want to add more security and permissions through setting database users, you must modify the `configuration.json` file in the main folder of the project. In it you can specify the different attributes of the database connection. However, the default values in the file will allow you to create a successful connection to the mysql database.

6. After completing the previous steps, at Visual Studio Code you will need to start the node.js server. To do this, open a terminal from inside your project's main folder and run the following code `node server.js`. If successfull, you should get a message stating `Server is up and running`


7. Now it´s time to run in terminal the following command:

`npm start`

The server will initialize with the message "Delilah Resto - Server Started..." and will show current date and time.

### Testing Endpoints

In order to test the API, you can use Postman to view the different endpoints and responses. The documentation for the Delilah Resto API can be found at [https://documenter.getpostman.com/view/12758287/TVRd8AW6]. It includes information on the different endpoints available.

During the database creation process, a generic administrator role user was created, also users without this role. You can replace this name and also anyone can create new users just sign in. 
It´s necessaired to fill this fields in order to obtain a token, so yo can make the requests yo need according to user´s profile you´re creating:

{
"username": "usuarioDeEjemplo",
"password": "fakepassword" (String)
}

There are a lot of exemplified endpoint results at postman´s URL. 
The requests will be made to the `localhost:3000/users/login` URL (for example, this is the endpoint for login process). Once those are added to the Postman request, you can press the "Send" button to send the request to the server.

At Postman you can realize if the request was valid or not, as I told before, the first step to test this API is this login/sign in process, because with this you´ll obtain the `Authorization` header with a `Bearer Token` that can be sent with future requests to other endpoints that require authorization.

### Other notes

-  If you wish to close the server, close the XAMPP and the VSC terminal and that will terminate the service.
