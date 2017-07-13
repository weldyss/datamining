 require 'factory_girl'

 class Person
   attr_accessor :id, :debt_type, :value, 
     :negotiating_value, :parcels, :civil_status, :sallary
 end

 FactoryGirl.define do
   factory :person do
     document "001"
     debt_type ["credit card", "financing", "retail", "bank"].sample
     value (1000..92300).to_a.sample
     negotiating_value value
     parcels (1..25).to_a.sample
     civil_status ["single", "married", "divorced", "other"].sample
     sallary (900..5000).to_a.sample
   end
 end

 person = FactoryGirl.build(:person)
 csv_string = CSV.generate do |csv| 
   csv << ["nome", "tipo_da_divida", "valor", "valor_negociado", "parcelas", "estado_civil", "salario"]
 end

 puts csv_string

