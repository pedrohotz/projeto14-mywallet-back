<h1 align="center"> MyWallet - API </h1>
<h1 align="center"><img src="./logo.png"></h1>

# Description
 
 My wallet is a mobile only aplication that is made to save your transactions, in this app you are able to create an account and login to see all your input and output transactions, with a total balace. 


# Getting started

``` postgresql
/* In your psql terminal */
CREATE DATABASE mywallet
/* Access the database */
\c mywallet
```
Run all commands from Dump.sql to populate DataBase
---
---
Running the Backend (server)
---

``` jsx
// Clone this repository
$ git clone git@github.com:pedrohotz/projeto14-mywallet-back.git
// Access the project folder cmd/terminal
$ cd projeto14-mywallet-back
// Install the dependencies
$ npm install
// Create a environment variable
Create a .env.test and .env file and fill it using your environment variables following the .env.example
// To run the tests 
$ npm run jest
//To run on prod environment (.env) 
$ npm run start
// to run on test environment (.env.test)
$ npm run test
// The server will start at port: 4000
```

# Tech Stack

The following tools were used in the construction of the project-api:

**Server**  ([NodeJS](https://nodejs.org/en/))

-   **[Express](https://expressjs.com/)**
-   **[CORS](https://expressjs.com/en/resources/middleware/cors.html)**
-   **[bcrypt](https://github.com/kelektiv/node.bcrypt.js)**
-   **[pg](https://github.com/brianc/node-postgres)**
-   **[dotENV](https://github.com/motdotla/dotenv)**
-   **[UUID](https://github.com/uuidjs/uuid)**
-   **[Joi](https://github.com/hapijs/joi)**
-   **[Eslint - Airbnb](https://github.com/airbnb/javascript)**
-   **[Jest](https://github.com/facebook/jest)**
-   **[Supertest](https://github.com/visionmedia/supertest)**



**Utilities**

-   Editor:  **[Visual Studio Code](https://code.visualstudio.com/)**
---

## How to contribute

1. Fork the project.
2. Create a new branch with your changes: `git checkout -b feat/myFeatureName`
3. For each feature implemented, make a commit specifying what was done
4. Submit your changes: `git push -u origin feat/myFeatureName`

---
## Author

Developed by Pedro Hotz Bronzato.