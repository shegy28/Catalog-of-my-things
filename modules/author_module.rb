require_relative '../Ruby_Classes/author'
require 'json'

module AuthorDataController
    def retrieve_authors
      if File.exist?('./json_data_files/author.json') && !File.empty?('./json_data_files/author.json')
        JSON.parse(File.read('./json_data_files/author.json')).map do |author|
          Author.new(author['first_name'], author['last_name'])
        end
      else
        []
      end
    end
  
    def save_authors
      data = []
      @author.each do |author|
        data.push({ first_name: author.first_name, last_name: author.last_name })
      end
      open('./json_data_files/author.json', 'w') { |f| f << JSON.generate(data) }
    end
end