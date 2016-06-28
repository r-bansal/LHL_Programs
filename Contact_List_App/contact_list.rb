require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  if ARGV[0].nil?
    puts "Here is a list of available commands: "
    puts "\tnew    - Create a new contact"
    puts "\tlist   - List all contacts"
    puts "\tshow   - Show a contact"
    puts "\tsearch - Search contacts"
  elsif ARGV[0] == "new"
    Contact.create(ARGV[1],ARGV[2])
  elsif ARGV[0] == "list"
    entire_list = Contact.all
    entire_list.each {|one_contact|
      puts "#{entire_list.index(one_contact)+1}: #{one_contact[0]} (#{one_contact[1]})"
    }
    puts "---"
    puts "#{entire_list.length} record total"
  elsif ARGV[0] == "show"
    x = Contact.find(ARGV[1].to_i)
    puts "Name: #{x[0]}, Email: #{x[1]}"
  elsif ARGV[0] == "search"
    Contact.search(ARGV[1])
  end
end
