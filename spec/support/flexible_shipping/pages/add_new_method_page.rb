class AddNewMethodPage
  include PageObject

  checkbox(:enable_method, id: 'woocommerce_flexible_shipping_method_enabled')
  text_field(:shipping_title, id: 'woocommerce_flexible_shipping_method_title')
  select_list(:shipping_zone, id: 'woocommerce_flexible_shipping_method_shipping_zone')
  select_list(:shipping_class, id: 'woocommerce_flexible_shipping_method_shipping_class')
  select_list(:based_on, id: 'woocommerce_flexible_shipping_method_based_on')
  text_field(:range_min, id: 'woocommerce_flexible_shipping_method_range_min')
  text_field(:range_max, id: 'woocommerce_flexible_shipping_method_range_max')
  text_field(:cost, id: 'woocommerce_flexible_shipping_method_cost')
  checkbox(:default_method, id: 'woocommerce_flexible_shipping_method_default')
  button(:save_changes, class: 'button-primary')

end
