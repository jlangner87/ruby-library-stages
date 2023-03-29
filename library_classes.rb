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

# Initializing seed library
Book.new("Six of Crows", "Leigh", "Bardugo", "Fantasy", "YA", "Hardcover", "Office: desk shelf")
Book.new("Crooked Kingdom", "Leigh", "Bardugo", "Fantasy", "YA", "Paperback", "Office: desk shelf")
Book.new("Shadow and Bone", "Leigh", "Bardugo", "Fantasy", "YA", "Paperback", "Office: desk shelf")
Book.new("Ruin and Rising", "Leigh", "Bardugo", "Fantasy", "YA", "Paperback", "Office: desk shelf")
Book.new("Siege and Storm", "Leigh", "Bardugo", "Fantasy", "YA", "Hardcover", "Office: desk shelf")
Book.new("Holes", "Louis", "Sachar", "Adventure", "Youth", "Paperback", "kid bedroom: chapter book basket")
Book.new("Bride Collector, The", "Ted", "Dekker", "Thriller", "Adult", "Hardcover", "Office: desk dhelf")
Book.new("Recursion", "Blake", "Crouch", "Sci-Fi", "Adult", "Paperback", "Office: desk shelf")
Book.new("Monster's New Undies", "Samantha", "Berger", "Children's", "3-6 years", "Paperback", "Livingroom: cube shelf")

# Search methods
def browse_all
  puts Book.catalog.sort_by {|book| book.title}
end

def search_by_title title
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
def process_checkout title, name
  Book.catalog.each { |book|
  if book.title.downcase == title.downcase
    book.status = "checked out"
    book.holder = name
  end
  }
end

def process_checkin title
  Book.catalog.each { |book|
  if book.title.downcase == title.downcase
    book.status = "available"
    book.holder = "The Library"
  end
  }
end

# loop to allow user to search the library
def search_catalog name, role
  search_methods = ["A = Browse All", "B = By Title", "C = By Author", "D = By Genre", "E = By Audience Age", "F = By Age & Genre"]
  loop do
    puts
    puts "Please choose one of the following search methods:"
    puts search_methods
    response = gets.chomp.downcase
    if response == "a"
      browse_all
    elsif response == "b"
      puts
      puts "Searching by TITLE"
      puts "Which title do you want to search?"
      title = gets.chomp.downcase
      search_by_title title
    elsif response == "c"
      puts
      puts "Searching AUTHOR"
    elsif response == "d"
      puts
      puts "Searching GENRE"
    elsif response == "e"
      puts
      puts "Searching AUDIENCE AGE"
    elsif response == "f"
      puts
      puts "Searching AGE & GENRE"
    else
      puts
      puts "That is not a search method. Try again."
    end
    puts
    puts " Do you want to keep searching? (Y/N)"
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

#loop allowing user to move between browsing and checking out
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

def primary_flow name, role
  staff_activity = ["A = Search Library", "B = Check in a Book", "C = Add a Book", "D = Delete a Book", "E = Exit"]
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
          puts "Entering Library Search..."
          search_catalog name, role
        elsif activity_response == "b"
          puts
          puts "Checking in a book..."
          puts "Which book are you checking in?"
          title = gets.chomp.downcase
          process_checkin title
        elsif activity_response == "c"
          puts
          puts "C"
        elsif activity_response == "d"
          puts
          puts "D"
        elsif activity_response == "e"
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
            authenticator
      end
    end
  end
end

authenticator