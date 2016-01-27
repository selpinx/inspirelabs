require 'spec_helper'

describe "Flexible Shipping test scenarios" do
	before(:all) do
		visit(WpLoginPage)
		on(WpLoginPage).login('selpinx', 'Hefalump650')
		#@current_page means lately used page
		on(WpSettingsPage).wait_until { @current_page.settings_page_loaded? }
		@global = {} #variable visible in all steps (it)
	end

  let(:shipping_method_1) { "List ekonomiczny"}
	let(:cost_1) { "10"}
  let(:shipping_method_2) { "List ekonomiczny 2"}
	let(:cost_2) { "20"}
	let(:product_name) { "Koszulka" }

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

    it "Add first shipping method" do
      on(FlexibleShippingSettingsPage).add_new_method
      on(AddNewMethodPage).check_enable_method
      on(AddNewMethodPage).shipping_title = shipping_method_1
      on(AddNewMethodPage).shipping_zone = "Polska"
      on(AddNewMethodPage).based_on = "Price (zł)"
      on(AddNewMethodPage).range_max = "10"
      on(AddNewMethodPage).cost = cost_1
      on(AddNewMethodPage).save_changes
    end

    it "Add second shipping method" do
      #make sure that "Add new" button is visible on the screen
      on(FlexibleShippingSettingsPage).add_new_method_element.scroll_into_view
      # on(FlexibleShippingSettingsPage).scroll_to(@current_page.add_new_method_element)
      on(FlexibleShippingSettingsPage).add_new_method_element.when_visible(30).click
      on(AddNewMethodPage).check_enable_method
      on(AddNewMethodPage).shipping_title = shipping_method_2
      on(AddNewMethodPage).shipping_zone = "Polska"
      on(AddNewMethodPage).based_on = "Price (zł)"
      on(AddNewMethodPage).range_min = "11"
      on(AddNewMethodPage).cost = cost_2
      on(AddNewMethodPage).save_changes
    end

    it "Save plugin settings changes" do
      on(FlexibleShippingSettingsPage).save_changes_element.when_visible(30).click
    end

		it 'Go to Shop' do
		  on(WpSettingsPage).go_to_shop
		end

		it 'Add product to cart' do
			@global[:product_price] = on(ShopMainPage).get_product_price(product_name)
			on(ShopMainPage).add_product_to_cart(product_name)
		end

		it 'Go to cart' do
		  visit(CartPage)
		end

		it 'Check that right shipping method is visible' do
			method_text = on(CartPage).get_shipping_method(shipping_method_2).text
			expect(method_text).to eq("#{shipping_method_2}: #{cost_2},00 zł")
		#była "." więc ktoś przestawił w Woo
    end

		it 'Check that correct tax value' do
			#calculate tax_value from product_price
		  expected_tax_value = ((@global[:product_price].to_i / 1.23) * 0.23).round(2)
			#istotne jest chyba ustawione zaokrąglenie w Woo
      #replace ',' to '.' in tax_value string
			current_tax_value = on(CartPage).get_tax_value.gsub(",",".").to_f
			expect(current_tax_value).to eq(expected_tax_value)
		end

		it "Go to Flexible Shipping Settings" do
			visit(FlexibleShippingSettingsPage)
		end

    it "Delete first shipping method" do
      on(FlexibleShippingSettingsPage).delete_shipping_method(shipping_method_1)
    end

    it "Delete second shipping method" do
      on(FlexibleShippingSettingsPage).delete_shipping_method(shipping_method_2)
    end
  end
end
