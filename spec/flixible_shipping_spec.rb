require 'spec_helper'

describe "Flexible Shipping test scenarios" do
	before(:all) do
		visit(WpLoginPage)
		on(WpLoginPage).login('selpinx', 'Hefalump650')
		on(WpSettingsPage).wait_until { @current_page.settings_page_loaded? } #@current_page means lately used page 
	end

	context 'First scenario' do
		it "First step" do
		end
	end
end