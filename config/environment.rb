# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

puts "filter_parameters: #{Rails.application.config.filter_parameters}"
puts "filter_attributes: #{ActiveRecord::Base.filter_attributes}"

exit
