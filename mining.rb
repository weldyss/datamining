require 'ruby-band'

#Client.new(:id, :debt_type, :debt_value, :negotiating_value, :parcels, :civil_status, :sallary)

dataset = Core::Parser.parse_CSV('all_data.csv')

dataset = Core::Type::Instances::Base.new do
  nominal :debt_type, ["credit card", "financing", "retail", "bank"]
  numeric :debt_value
  numeric :negotiating_value
  numeric :parcels
  nominal :civil_status, ["single", "married", "divorced", "other"]
  numeric :sallary
end
