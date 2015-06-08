RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  let(:second_book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end


  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).eql? 0
    end
  end

  context ".add_entry" do
    it "adds only one entry to the address book" do 
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      expect(book.entries.size).eql? 1
      expect(new_entry.name).eql? 'Ada Lovelace'
      expect(new_entry.phone_number).eql? '010.012.1815'
      expect(new_entry.email).eql? 'augusta.king@lovelace.com'
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eql 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-5555", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5555", "bob@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-5555", "joe@blocmail.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-5555", "sally@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-5555", "sussie@blocmail.com")
    end

    it "imports the 1st entry from entries_2.csv" do
      second_book.import_from_csv("entries_2.csv")
      entries_2_1 = second_book.entries[0]
      check_entry(entries_2_1, "Jill", "555-555-5555", "jill@blocmail.com")
    end

    it "imports the 2nd entry from entries_2.csv" do
      second_book.import_from_csv("entries_2.csv")
      entries_2_2 = second_book.entries[1]
      check_entry(entries_2_2, "Julia", "555-555-5555", "julia@blocmail.com")
    end

    it "imports the 3rd entry from entries_2.csv" do
      second_book.import_from_csv("entries_2.csv")
      entries_2_3 = second_book.entries[2]
      check_entry(entries_2_3, "Nina", "555-555-5555", "nina@blocmail.com")
    end
  end
end
