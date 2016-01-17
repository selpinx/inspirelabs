require 'watir-webdriver'
require 'pry'
require 'require_all'
require 'page-object'
require 'watir-scroll'

require_rel 'support'

RSpec.configure do |config|
	config.include PageObject::PageFactory

	config.before(:all) do
		@browser = Watir::Browser.new :firefox
		@browser.window.resize_to 1200, 850
		@browser.window.move_to 0, 0
	end

	config.after(:all) do
		@browser.close
	end
end




		 