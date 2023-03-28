library = [
  {
    title: "holes",
    author: "louis sachar",
    genre: "coming of age",
    age_level: "youth",
    cover_type: "paperback",
    location: "kids room | chapter book basket"
  },
  {
    title: "sideways stories from wayside school",
    author: "louis sachar",
    genre: "coming of age",
    age_level: "youth",
    cover_type: "paperback",
    location: "kids room | chapter book basket"
  },
  {
    title: "wayside school is falling down",
    author: "louis sachar",
    genre: "coming of age",
    age_level: "youth",
    cover_type: "paperback",
    location: "kids room | chapter book basket"
  },
  {
    title: "wayside school gets a little stranger",
    author: "louis sachar",
    genre: "coming of age",
    age_level: "youth",
    cover_type: "paperback",
    location: "kids room | chapter book basket"
  },
  {
    title: "six of crows",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "hardcover",
    location: "office shelf"
  },
  {
    title: "krooked kingdom",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "shadow and bone",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "siege and storm",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "ruin and rising",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "king of scars",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "hardcover",
    location: "office shelf"
  },
  {
    title: "rule of wolves",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "hardcover",
    location: "office shelf"
  },
  {
    title: "rule of wolves",
    author: "leigh bardugo",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "hardcover",
    location: "office shelf"
  },
  {
    title: "the hunger games",
    author: "suzanne collins",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "catching fire",
    author: "suzanne collins",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "mockingjay",
    author: "suzanne collins",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
    title: "the ballad of songbirds and snakes",
    author: "suzanne collins",
    genre: "fantasy",
    age_level: "young adult",
    cover_type: "paperback",
    location: "office shelf"
  },
  {
  title: "recursion",
  author: "blake crouch",
  genre: "sci-fi",
  age_level: "adult",
  cover_type: "paperback",
  location: "office shelf"
},
{
  title: "the bride collector",
  author: "ted dekker",
  genre: "thriller",
  age_level: "adult",
  cover_type: "hardcover",
  location: "office shelf"
},
]




def title_search (catalog, book_title)
  result_title = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:title]}
  result_author = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:author]}
  result_genre = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:genre]}
  result_age_level = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:age_level]}
  result_cover_type = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:cover_type]}
  result_location = catalog.select{|book| book[:title].downcase.include?(book_title)}.map{|book| book[:location]}
  output = "
  Title: #{result_title}
  Author: #{result_author}
  Genre: #{result_genre}
  Audience: #{result_age_level}
  Binding: #{result_cover_type}
  Location: #{result_location}"
  return output.delete('"[]').upcase
end

def author_search (catalog, book_author)
  i = 0
  catalog.each do |book|
    if book.has_value?(book_author.downcase)
      i+=1
      puts "#{i}.)  #{book[:title].upcase}"
    end
  end
end

def age_level_search (catalog, book_age_level)
end

def genre_search (catalog, book_genre)
end

def show_all_books(catalog)
  i = 0
  catalog.each do |book|
    i+=1
    puts "#{i}.) #{book[:title].upcase}"
  end
end

puts "Welcome to the Langner Library"
25.times{print " -"}

loop do
  puts
  puts "How do you want to search?"
  puts "ALL | TITLE | AUTHOR | GENRE | AGE"
  method = gets.chomp.downcase
  if method == "title"
    puts "Which book are you searching for?"
    title_query = gets.chomp.downcase
    return_data = title_search(library, title_query)
    puts return_data
  elsif method == "author"
    puts "Which author are you searching for?"
    author_query = gets.chomp
    puts
    puts "Available books by #{author_query}:"
    return_data = author_search(library, author_query)
  elsif method == "genre"
    puts "This will call the genre search method"
  elsif method == "age"
    puts "This will call the age search method"
  elsif method == "all"
    puts
    list = show_all_books(library)
    puts
  else
    puts "That is not a search method"
  end
  puts
  puts "Would you like to search for another book? (Y/N)"
  response = gets.chomp.downcase
  if response != "y"
    break
  end
end