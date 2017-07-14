require 'factory_girl'
require 'csv'
require './helpers'

class Person
  attr_accessor :id, :debt_type, :debt_value, 
    :negotiating_value, :parcels, :civil_status, :sallary
end

FactoryGirl.define do
  sequence :auto_id do |n| 
    "#{n}"
  end
  factory :person do
    id { FactoryGirl.generate(:auto_id) }
    debt_type { ["credit card", "financing", "retail", "bank"].sample }
    debt_value { (1000..92300).to_a.sample }
    negotiating_value (:debt_value) 
    parcels { (1..25).to_a.sample }
    civil_status { ["single", "married", "divorced", "other"].sample }
    sallary { (900..5000).to_a.sample }
  end
end

def run_forrest 
  print_memory_usage do
    print_time_spent do
      headers = ['id', 'debt_type', 'debt_value', 'negotiating_value', 'parcels', 'civil_status', 'sallary']
      all_person = []
      127_000.times do 
        all_person << FactoryGirl.build(:person)
      end

      CSV.open('all_data.csv', 'w', write_headers: true, headers: headers) do |csv|
        all_person.each do |i|
          csv << [i.id, i.debt_type, i.debt_value, i.negotiating_value, i.parcels, i.civil_status, i.sallary]
        end
      end
    end
  end
end


