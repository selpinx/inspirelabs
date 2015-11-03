class WooSettingsPage
  include PageObject

  page_url "http://woocommercebeta.stage.inspirelabs.pl/wp-admin/admin.php?page=wc-settings"

  def go_to(tab_name)
    #href is set as Regular Expression (RegExp) to find all link elements containing text between "/ .... /"
    link_element(class: 'nav-tab', href: /#{tab_name}/).when_visible.click
  end

  def go_to_shipping_options(tab_name)
    unordered_list_element(class: 'subsubsub').link_element(href: /#{tab_name}/).when_visible.click
  end
end
