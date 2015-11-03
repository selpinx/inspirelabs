class FlexibleShippingSettingsPage
  include PageObject

  checkbox(:enable_plugin, id: 'woocommerce_flexible_shipping_enabled')
  link(:add_new_method, class: 'add-new-h2')
  button(:save_changes, class: 'button-primary')

  def select_tax_status(status)
    div_element(id: 's2id_woocommerce_flexible_shipping_tax_status').link_element.click
    div_element(text: "#{status}").when_visible.click
  end

  def select_condition(condition)
    div_element(id: 's2id_woocommerce_flexible_shipping_condition').link_element.click
    div_element(text: "#{condition}").when_visible.click
  end


end
