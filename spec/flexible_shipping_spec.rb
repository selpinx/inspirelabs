require 'spec_helper'

describe "Flexible Shipping test scenarios" do
	before(:all) do
		visit(WpLoginPage)
		on(WpLoginPage).login('selpinx', 'Hefalump650')
		on(WpSettingsPage).wait_until { @current_page.settings_page_loaded? } #@current_page means lately used page
	end

	context 'Configuration of general settings' do

    it "Go to Woo Settings configuration page" do
      visit(WooSettingsPage)
    end
    it "Go to Shipping tab" do
      on(WooSettingsPage).go_to("shipping")
    end

    it "Go to Flexible Shipping plugin settings page" do
      on(WooSettingsPage).go_to_shipping_options("flexible_shipping")
    end

    it "Enable plugin" do
      on(FlexibleShippingSettingsPage).check_enable_plugin

    end
    it "Set tax status" do
      on(FlexibleShippingSettingsPage).select_tax_status("None")
    end

    it "Set condition" do
      on(FlexibleShippingSettingsPage).select_condition("Per order")
    end

    it "Add first shipment method" do
      on(FlexibleShippingSettingsPage).add_new_method
      on(AddNewMethodPage).check_enable_method
      on(AddNewMethodPage).shipping_title = "List ekonomiczny"
      on(AddNewMethodPage).shipping_zone = "Polska"
      on(AddNewMethodPage).based_on = "Price (zł)"
      on(AddNewMethodPage).range_max = "10"
      on(AddNewMethodPage).cost = "10"
      on(AddNewMethodPage).save_changes
    end


    it "Add second shipment method" do
      #make sure that "Add new" button is visible on the screen
      on(FlexibleShippingSettingsPage).add_new_method_element.scroll_into_view
      # on(FlexibleShippingSettingsPage).scroll_to(@current_page.add_new_method_element)
      on(FlexibleShippingSettingsPage).add_new_method_element.when_visible(30).click
      on(AddNewMethodPage).check_enable_method
      on(AddNewMethodPage).shipping_title = "List ekonomiczny 2"
      on(AddNewMethodPage).shipping_zone = "Polska"
      on(AddNewMethodPage).based_on = "Price (zł)"
      on(AddNewMethodPage).range_min = "11"
      on(AddNewMethodPage).cost = "20"
      on(AddNewMethodPage).save_changes
    end

    it "Save plugin settings changes" do
      on(FlexibleShippingSettingsPage).save_changes_element.when_visible(30).click
    end
	end
end