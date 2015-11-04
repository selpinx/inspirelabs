class CartPage
	include PageObject

	page_url "http://woocommercebeta.stage.inspirelabs.pl/koszyk/"
	p(:cart_status, class: 'cart-empty')
	small(:tax_value, class: 'includes_tax')

	def cart_empty?
		self.cart_status?
	end

	def get_shipping_method(method_name)
		self.list_item_element(text: /#{method_name}/).when_visible
	end

	def get_tax_value
		self.tax_value_element.span_element(class: 'amount').text[0..-4]
	end
end
