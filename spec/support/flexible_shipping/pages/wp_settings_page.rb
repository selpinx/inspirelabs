class WpSettingsPage
	include PageObject

	link(:beta, text: 'Beta')
	h1(:header, css: ".wrap > h1")

	def settings_page_loaded?
		header_element.visible?
	end

	def go_to_shop
		self.beta_element.when_visible.click
	end
end
