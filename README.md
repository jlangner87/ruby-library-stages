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

The book data could be so much more robust and useful if they were programmed as instances in a Book class. The control flows need to be refactored and cleaned up for readability. Many of the methods of the function should be moved outside of the control flow, so that they are global methods and can be used in multiple flows.

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

##### Areas to improve in the next iteration:

Add authentication.

---

### **_Future Iterations_**

I am currently (as of 03/28/2023) adding a CardHolder class where library card holders can be stored. Then the program will check if the user is a member before allowing them to check out the book.

A method that adds books to the CardHolder object when a book is checked out and removes them when the book is checked back in.

A LibraryStaff class where library staff can be stored as objects.

An admin control flow that is only accessible to users in the Library Staff class. Methods to add (Create) books, edit book information (update), and take books out of circulation (delete).

End goal: Move away from CLI interaction and have a fully functioning frontend for users to interact with.

---

### **_Technologies Used_**

- Ruby
- Rails

---

### **_Resources_**

- [Ruby Docs](https://www.ruby-lang.org/en/documentation/)
- [Launch School](https://launchschool.com/books/ruby)
- [CodeCademy](https://www.codecademy.com/learn/learn-ruby/modules/learn-ruby-introduction-to-ruby-u/cheatsheet)
- [Udemy](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/)
