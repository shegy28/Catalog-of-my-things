require_relative '../Ruby_Classes/label'
require 'json'

module LabelsData
  def load_labels
    file = './json_data_files/labels.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['title'], element['color']))
      end
    end
    data
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('./json_data_files/labels.json', JSON.pretty_generate(data))
  end
end
