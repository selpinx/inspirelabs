class FlexibleShippingSettingsPage
  include PageObject

  checkbox(:enable_plugin, id: 'woocommerce_flexible_shipping_enabled')
  link(:add_new_method, class: 'add-new-h2')
  button(:save_changes, class: 'button-primary')
  table(:shipping_methods_table, class: 'wc_shipping widefat wp-list-table')
  div(:message_box, id: 'message')


  def delete_shipping_method(method)
    shipping_methods_table_element["#{method}"][11].link_element.click
    puts self.message_box_element.when_visible.text
    self.wait_until {self.message_box == "Shipping method #{method} deleted."}
  end

  def select_tax_status(status)
    div_element(id: 's2id_woocommerce_flexible_shipping_tax_status').link_element.click
    div_element(text: "#{status}").when_visible.click
  end

  def select_condition(condition)
    div_element(id: 's2id_woocommerce_flexible_shipping_condition').link_element.click
    div_element(text: "#{condition}").when_visible.click
  end
end
