class ShopMainPage
	include PageObject

	def get_product(product_name)
		self.list_item_element(text: /#{product_name}/)
	end

	def get_product_price(product_name)
		self.get_product(product_name).span_element(class: 'amount').text[0..-4]
	end
	
	def add_product_to_cart(product_name)
		self.get_product(product_name).link_element(text: 'Add to cart').scroll_into_view
		self.get_product(product_name).link_element(text: 'Add to cart').click
	end
end
