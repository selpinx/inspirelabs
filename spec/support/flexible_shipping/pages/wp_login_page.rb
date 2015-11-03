class WpLoginPage
	include PageObject

	page_url "http://woocommercebeta.stage.inspirelabs.pl/wp-admin/"

	text_field(:user, id: "user_login")
	text_field(:password, id: "user_pass")
	button(:log_in, id: "wp-submit")
	checkbox(:remember_me, id: "rememberme")

	def login(login, password)
		self.user_element.when_visible #wait until user textfield will be visible
		self.user = login
		self.password = password
		self.check_remember_me
		self.log_in
	end
end