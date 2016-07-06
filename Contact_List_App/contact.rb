require 'csv'
require 'pry'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email

  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(name, email)
    @name = name
    @email = email
    # TODO: Assign parameter values to instance variables.
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # // --- RB: What does 'x' refer to? Try to be more specific about variables.
      excel = CSV.read('contacts.csv')
      excel.map { |x| Contact.new(x[0],x[1])}  #,x[1])
      excel
      # CSV.foreach('contacts.csv') do |row|
      #   puts row.inspect
      # end
      # excel = CSV.read('contacts.csv')
      # return excel.map {|cols| Contact.new(cols[0], cols[1])}
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      #

    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      # binding.pry
      CSV.open("contacts.csv","ab") do |csv|
        csv << [name,email]
      end
      # // --- RB: You do not require return in Ruby, last line executed is returned by default. Few examples of this
      return Contact.new(name,email)

      # a_string = "#{name},#{email}"
      # CSV.parse(a_string)
    end

    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      excel = CSV.read('contacts.csv')
      excel.each {|person|
        return person if (excel.index(person)+1) == id
      }
    end

    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      excel = CSV.read('contacts.csv')
      search_term = []
      excel.each {|person|
        if (person[0].include?(term) || person[1].include?(term))
          search_term << person
          puts "#{excel.index(person)+1}: #{person[0]} (#{person[1]})"
        end
      }
      puts "---"
      puts "#{search_term.length} record total"
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

  end
end


# new_contact, show_list, show_contact, search_contact = ARGV




# pp Contact.find(1)
# elsif ARGV[0] = "new"
#   # puts "Input a name"
#   # temp_name = gets.chomp
#   # puts "Input email"
#   # temp_email = gets.chomp
#   # Contact.new(temp_name,temp_email)
# elsif ARGV[0] == "list"
#   # Contact.all

# # elsif ARGV[0] == "search"
# #   puts "Input a search term"
# #   temp_term = gets.chomp
# #   Contact.search(temp_term)
# elsif ARGV[0] == "search"
#   puts "Input a search term"
#   temp_term = gets.chomp
#   Contact.search(temp_term)


# pp Contact.find(1)
# Contact.search('David')
# puts Contact.all
# puts ' '
# puts Contact.create("hihi","foo@example.com")
# puts Contact.create("Davidefef","hehe.com")
# puts Contact.create("Davidefefff","hehe.cosfm")
# puts Contact.all
