class WpSettingsPage
	include PageObject

	h1(:header, css: ".wrap > h1")

	def settings_page_loaded?
		header_element.visible?
	end
end