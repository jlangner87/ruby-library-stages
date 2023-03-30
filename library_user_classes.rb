class Book
  attr_accessor :title, :author_last_name, :author_first_name, :genre, :audience, :binding, :location, :status, :holder
  @@catalog = []
  @@local_id = 100
  def initialize(title, author_firstname, author_lastname, genre, audience, book_binding, location)
    @local_id = @@local_id += 1
    @title = title
    @author_first_name = author_firstname
    @author_last_name = author_lastname
    @genre = genre
    @audience = audience
    @binding = book_binding
    @location = location
    @status = "available"
    @holder = "The Library"
    @@catalog << self
  end

  def self.catalog
    @@catalog
  end

  def to_s
    puts
    "
    Local ID: #{@local_id}
    Title: #{@title}
    Author: #{@author_last_name}, #{@author_first_name}
    Genre: #{@genre}
    Audience: #{@audience}
    Cover: #{@binding}
    Located: #{@location}
    This book is currently #{@status}
    In posession of #{@holder}
    "
  end
end

class User
  attr_accessor :f_name, :l_name, :password, :role, :local_id, :checkout_list, :checkout_qty
  @@local_id = 100
  @@user_list = []
  @@staff_list = []
  @@cardholder_list = []
  @@checkout_qty = 0


  def initialize(f_name, l_name, password, role)
    @f_name = f_name
    @l_name = l_name
    @password = password
    @role = role
    @@user_list << self
    if role.downcase == "staff"
      @local_id = "S—#{@@local_id+= 1}"
      @@staff_list << self
    else
      @local_id = "M—#{@@local_id+= 1}"
      @checkout_list = ["Seed Book"]
      @checkout_qty = @checkout_list.length
      @@cardholder_list << self
    end
  end

  def self.user_list
    @@user_list
  end

  def self.staff_list
    @@staff_list
  end

  def self.cardholder_list
    @@cardholder_list
  end

  def self.checkout_list
    @@checkout_list
  end

  def to_s
    puts
    "
    Name: #{@l_name}, #{f_name}
    Role: #{role}
    "
  end
end

# Initializing seed users
User.new("Joshua", "Langner", "password123", "staff")
User.new("Ava", "Langner", "password123", "cardholder")
User.new("Krista", "Langner", "password123", "staff")
User.new("Reign", "Langner", "password123", "cardholder")

# Initializing seed books
Book.new("Six of Crows", "Leigh", "Bardugo", "FNTSY", "YA", "Hardcover", "Office: desk shelf")
Book.new("Crooked Kingdom", "Leigh", "Bardugo", "FNTSY", "YA", "Paperback", "Office: desk shelf")
Book.new("Shadow and Bone", "Leigh", "Bardugo", "FNTSY", "YA", "Paperback", "Office: desk shelf")
Book.new("Ruin and Rising", "Leigh", "Bardugo", "FNTSY", "YA", "Paperback", "Office: desk shelf")
Book.new("Siege and Storm", "Leigh", "Bardugo", "FNTSY", "YA", "Hardcover", "Office: desk shelf")
Book.new("Holes", "Louis", "Sachar", "ADV", "MG", "Paperback", "kid bedroom: chapter book basket")
Book.new("Bride Collector, The", "Ted", "Dekker", "THRL", "A", "Hardcover", "Office: desk dhelf")
Book.new("Recursion", "Blake", "Crouch", "SCI", "A", "Paperback", "Office: desk shelf")
Book.new("Monster's New Undies", "Samantha", "Berger", "CHILD", "CH", "Paperback", "Livingroom: cube shelf")
Book.new("Greatest Tales of Horror", "HP", "Lovecraft", "CLAS", "A", "Harcdover", "Office: desk shelf")
Book.new("Hooked", "Les", "Edgerton", "NF", "A", "Paperback", "Office: Stacked under the sharpie cup")
Book.new("The Foot Book", "Dr.", "Seuss", "CHILD", "TB", "Board Book", "Livingroom: cube shelf")
Book.new("Our Town", "Thornton", "Wilder", "SCR", "A", "Paperback", "Office: desk shelf")


# Search methods
def browse_all
  puts
  puts Book.catalog.sort_by {|book| book.title}
end

def search_by_title title
  puts
  puts "Books matching the title: #{title}"
  20.times{print " -"}
  puts
  Book.catalog.sort_by {|book| 
    if book.title.downcase == title.downcase
      puts "
      Title: #{book.title}
      Author: #{book.author_last_name}, #{book.author_first_name}"
    end
  }
  puts
  puts "End of results"
end

def search_by_author l_name, *f_name
  puts
  puts "Books matching the author: #{f_name} #{l_name}"
  20.times{print " -"}
  puts
  Book.catalog.sort_by {|book|
  if book.author_last_name.downcase == l_name.downcase
    puts book.title
  end
}
  puts
  puts "End of results"
end

def search_by_genre genre
  puts
  puts "Books matching the genre: #{genre}"
  20.times{print " -"}
  puts
  Book.catalog.sort_by {|book|
  if book.genre.downcase == genre.downcase
    puts book.title
  end
}
  puts
  puts "End of results"
end

def search_by_audience_age audience
  puts
  puts "Books matching the audience age: #{audience}"
  20.times{print " -"}
  puts
  Book.catalog.sort_by {|book|
  if book.audience.downcase == audience.downcase
    puts book.title
  end
}
  puts
  puts "End of results"
end

def search_by_genre_audience_age genre, audience
  puts
  puts "Books matching: #{audience} & #{genre}"
  20.times{print " -"}
  puts
  Book.catalog.sort_by {|book|
  if book.audience.downcase == audience.downcase && book.genre.downcase == genre.downcase
    puts book.title
  end
}
  puts
  puts "End of results"
end

# Method creating a new instance of the book. At this point, it only works until the loop closes
def add_book title, author_last_name, author_first_name, genre, audience, book_binding, location
  Book.new(title, author_last_name, author_first_name, genre, audience, book_binding, location)
end

# Method deleting an instance of a book
def delete_book title
  Book.catalog.sort_by {|book| 
    if book.title.downcase == title.downcase
      Book.catalog.delete(book)
      puts
      puts "The book has been deletd from the catalog"
    end
  }
end

# Method checking the status of a book
def status_query title
  Book.catalog.each { |book|
  if book.title.downcase == title.downcase
    if book.status.downcase == "available"
      return "available"
    else
      return "checked out"
    end
  end
  }
end

# Method changing the checkout status and book holder attributes
def update_checkout_data title, input_name
  User.cardholder_list.each {|user|
    if user.f_name.downcase == input_name.downcase
      user.checkout_list.append(title.upcase)
      user.checkout_qty += 1
    end
    }
end

def process_checkout title, name
  Book.catalog.each { |book|
  if book.title.downcase == title.downcase
    book.status = "checked out"
    book.holder = name
  end
  }
  update_checkout_data title, name
end

def process_checkin title
  Book.catalog.each { |book|
  if book.title.downcase == title.downcase
    book.status = "available"
    book.holder = "The Library"
  end
  }
end

# Search method for all cardholders
def all_cardholders
  User.cardholder_list.sort_by{|user| user.f_name
    puts
    puts "
    Member ID: #{user.local_id}
    Name: : #{user.l_name}, #{user.f_name}
    Checkout Qty: #{user.checkout_qty}
    Titles Checked Out: #{user.checkout_list}
    "

  }
end

# Search method for all staff
def all_staff
  User.staff_list.sort_by{|user| user.f_name
    puts
    puts "
    Staff ID: #{user.local_id}
    Name: : #{user.l_name}, #{user.f_name}"
}
end

# loop to allow user to search the library
def search_catalog name, role
  search_methods = ["A = Browse All", "B = By Title", "C = By Author", "D = By Genre", "E = By Audience Age", "F = By Age & Genre"]
  genres = ["FNTSY = Fantasy", "SCI = Sci-Fi", "THRL = Thriller", "ADV = Adventure", "CHILD = Children's", "NF = Non-Fiction", "SCR = Script", "CLAS = Classic",]
  age = ["A = Adult", "YA = Young Adult", "MG = Middle Grade", "CH = Children", "TB = Toddlers & Babies"]
  loop do
    puts
    puts "Please choose one of the following search methods:"
    puts search_methods
    response = gets.chomp.downcase
    if response == "a"
      browse_all
    elsif response == "b"
      puts
      puts "Searching by TITLE. . ."
      puts "Which title do you want to search?"
      title = gets.chomp.downcase
      search_by_title title
    elsif response == "c"
      puts
      puts "Searching AUTHOR. . ."
      puts "What is the last name of the author you want to search?"
      l_name = gets.chomp.downcase
      puts
      puts "What is the first name of the author you want to search?"
      f_name = gets.chomp.downcase
      search_by_author l_name, f_name
    elsif response == "d"
      puts
      puts "Searching GENRE. . ."
      puts "Which genre would you like to search?"
      puts genres
      genre_query = gets.chomp.downcase
      search_by_genre genre_query
    elsif response == "e"
      puts
      puts "Searching AUDIENCE AGE. . ."
      puts "Which age group do you want to searh?"
      puts age
      age_query = gets.chomp.downcase
      search_by_audience_age age_query
    elsif response == "f"
      puts
      puts "Searching AGE & GENRE. . ."
      puts "Which age group do you want to searh?"
      puts age
      age_query = gets.chomp.downcase
      puts "Which genre would you like to search?"
      puts genres
      genre_query = gets.chomp.downcase
      search_by_genre_audience_age genre_query, age_query
    else
      puts
      puts "That is not a search method. Try again."
    end
    puts
    puts "Do you want to keep searching? (Y/N)"
    continue_response = gets.chomp.downcase
    if continue_response != "y"
      puts
      puts "Exiting search..."
      primary_flow name, role
    end
  end
end

# loop to allow user to check out multiple books
def checkout_flow name
  loop do
    puts
    puts "Which book do you want to check out?"
    query = gets.chomp.capitalize
    availability = status_query query
    puts
    puts "#{query} is currently #{availability}"
    if availability == "available"
      puts "Do you want to check this book out? (Y/N)"
      response = gets.chomp.downcase
      if response == "y"
        new_checkout = process_checkout query, name
        puts
        puts "Thank you for checking out #{query}"
        puts
        puts "Would you like to check out another book? (Y/N)"
        response = gets.chomp.downcase
        if response != "y"
          puts "Happy Reading! Hope to see you soon!"
          authenticator
        end
      else
        puts
        puts "Okay, we will put that back on the shelf"
        puts
        puts "Do you want to check out something else? (Y/N)"
        response = gets.chomp.downcase
        if response != "y"
          puts "Thank you. Come again."
          authenticator
        end
      end
    else
      puts
      puts "Do you want to search for a different book? (Y/N)"
      response = gets.chomp.downcase
      if response != "y"
        authenticator
      end
    end
  end
end

# Authentication of user and splitting the control flow into user and staff branches
#   FUTURE: I want to work actual authentication into this method.
def authenticator
  puts "Welcome to the Langner Library."
  puts "Please enter your full name."
  name = gets.chomp
  puts
  puts "Welcome #{name}!"
  puts "Are you a card holder or library staff?"
  puts " Enter C for card holder or S for staff:"
  role = gets.chomp.downcase
  primary_flow name, role
end

#loop allowing user to move between browsing and checking out
def primary_flow name, role
  staff_activity = ["A = Search Library", "B = Check in a Book", "C = Add a Book", "D = Delete a Book", "E = Search Card Holders", "F = Search Staff", "X = Exit"]
  loop do
    if role != "s"
      puts
      puts "Would you like to browse the titles or check something out now?"
      puts "Enter B to browse or C to checkout."
      flow = gets.chomp.downcase
      if flow == "b"
        search_catalog name, role
      elsif flow == "c"
        checkout_flow name
      else
        "That was not an option. Let's try that again"
      end
    else
      puts
      puts "What would you like to do?"
      puts staff_activity
      activity_response = gets.chomp.downcase
        if activity_response == "a"
          puts
          puts "Entering Library Search. . ."
          search_catalog name, role
        elsif activity_response == "b"
          puts
          puts "Checking in a book. . ."
          puts "Which book are you checking in?"
          title = gets.chomp.downcase
          process_checkin title
        elsif activity_response == "c"
          puts
          puts "Adding a book . . ."
          print "Title: "
          title = gets.chomp
          puts
          print "Author L Name: "
          author_last_name = gets.chomp
          puts
          print "Author F Name: "
          author_first_name = gets.chomp
          puts
          print "Genre: "
          genre = gets.chomp
          puts
          print "Age Group: "
          audience = gets.chomp
          puts
          print "Binding: "
          book_binding = gets.chomp
          puts
          print "Location: "
          location = gets.chomp
          add_book title, author_last_name, author_first_name, genre, audience, book_binding, location
        elsif activity_response == "d"
          puts
          puts "Deleting a book. . ."
          puts "Which book would you like to delete?"
          print "Title: "
          title = gets.chomp.downcase
          puts
          puts "THIS IS IRREVERSIBLE! DO YOU WANT TO DELETE #{title.upcase}?"
          puts "Enter #86! to delete. Enter anything else to cancel."
          delete_response = gets.chomp.downcase
          if delete_response == "#86!"
            delete_book title
          end
        elsif activity_response == "e"
          puts
          puts "Searching Cardholders. . ."
          all_cardholders
        elsif activity_response == "f"
          puts
          puts "Searching Staff. . ."
          all_staff
        elsif activity_response == "x"
          puts
          puts "Okay, bye."
          abort
        else
          puts "That is not an option. Try again."
        end
        puts "Would you like to do something else? (Y/N)"
          response = gets.chomp.downcase
          if response != "y"
            puts
            puts "Thank you. See you soon."
            abort
      end
    end
  end
end

authenticator