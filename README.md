![](./assets/library_banner.png)

---

## Library Catalog — _Learning Ruby Documented in Stages_

### Joshua Langner

##### Februrary 2023 - Present

| [LinkedIn](https://www.linkedin.com/in/josh-langner-48) | [GitHub](https://github.com/jlangner87) | [Portfolio](https://joshua-langner.com) |

---

## Contnets

1. [About This Repo](/README.md#about-this-repo)
2. [Stage 1: Funfamentals of Ruby](/README.md#stage-1-fundamentals-of-ruby)
3. [Stage 2: Learning Object Oriented Programming in Ruby](/README.md#stage-2-learning-object-oriented-programming-in-ruby)

### **_About This Repo:_**

In a proactive effort to grow my skills and make myself a more valuable asset to future employers, I have taken on learning a new tech stack. **My goal** is to be proficient in developing dynamic ReactJS applications that utilize Ruby on Rails for Backend by the end of April 2023.

This repo contains multiple iterations of one project— each project demonstrating the practical application of the fundamentals of Ruby at that stage of learning.

I learn by doing. At each stage of learning, I pause and put my new knowledge to work with practical-application projects. Through the learning process, I recognize areas where my projects can be improved.

Rather than eliminating the early iterations, I chosen to keep them documented side-by-side in this repo, so that I could have linear documentation of incremental growth.

---

### **_Stage 1: Fundamentals of Ruby_**

file: _library_hashes.rb_

##### Key Principles Used

- Arrays
- Hashes
- Methods
- Loops

##### Overview

In this project, I created a library array where I stored books as hashes.
I used for loops and if/else statements to create a control flow. Then I created search methods that take user CLI input as arguments and return the desired data.

##### Areas to improve in the next iteration:

The book data could be so much more robust and useful if it was programmed as instances of a Book class. The control flows need to be refactored and cleaned up for readability. Many of the methods of the function should be moved outside of the control flow, so that they are global methods and can be used in multiple flows.

---

### **_Stage 2: Learning Object Oriented Programming in Ruby_**

file: _library_classes.rb_

##### Key Principles Used

- Class
- Initialize method
- Getter Methods
- Setter Methods

##### Overview

Once I had the library set up with a Book Class, it opened up a several new ideas that I was able to quickly implement.

- Attribute that indicated whether the book was checked in or out.
- Attribute that provided data about who had the book checked out.
- Method for checking the availability status of the book.
- Checkout method (switch the status from "available" to "checked out" and add the user's name to the bookholedr attribute)
- Library staff control flow with methods for checking books in and deleting books from the catalog.

##### Areas to improve in the next iteration:

Create a User class with a role attrubute.

- if User != "cardholder" take them to the registration flow
- if User != "staff" restrict access to the staff flow
- Additional staff methods: Delete cardholder

Tidy up the control flows. Once again, move some of the functionality into global methods that can be reused in other areas of the program.

---

### **_Stage 3: More with Object Oriented Programming in Ruby_**

file: _library_user_classes.rb_

##### Key Principles Used

- Class
- Initialize method
- Getter Methods
- Setter Methods

##### Overview

Added User class. Instances of User are sorted by "role" attribure and stored as either "staff" or "cardholder."

Control flow branches based on User role.

Added authentication method that:

- Takes name and password input
- Checks username and password input against username and password User attributes
- If User passes, their role attribute is checked and they are sent to the branch that corresponds with their role.

Added signup method that:

- Asks user if they have an account
- If they do not have an account, signup method is called
- Calls a set_password method
- Uses the input to initalize a new instance of User
- Routes User back to the password screen

set_password method:

- Requires new User to create a new password.
- Prompts new user to enter the new password again.
- If the passwords match, password value is set as password attribute
- If the passwords do not match, User is looped back to the beginning of set_password

##### Areas to improve in the next iteration:

Set parameters for strong passwords.

Add username attribute to User and authenticate with username instead of f_name.

Refactor control flow, so that:

- When User is done with an activity, they loop back to the options for their role (rather than looping back to the login)
- Logout option that loops back to authentication method
- Only staff Users have ability to close program.

---

### **_Stage 4: Ruby on Rails_**

##### Pausing this project to take some time to leaern the basics of Ruby on Rails.

Stage 4 will be a complete refactoring of the application. My goal is to use MCV architecture in order to best accomplish user interaction with the "Users" and "Books" models.

---

### **_End Goal_**

Move away from CLI to a fully functioning React frontend calling a Ruby on Rails API

---

### **_Resources_**

- [Ruby Docs](https://www.ruby-lang.org/en/documentation/)
- [Launch School](https://launchschool.com/books/ruby)
- [CodeCademy](https://www.codecademy.com/learn/learn-ruby/modules/learn-ruby-introduction-to-ruby-u/cheatsheet)
- [Udemy](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/)
