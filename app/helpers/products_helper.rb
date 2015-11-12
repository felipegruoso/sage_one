module ProductsHelper

  def get_value(field, default = "&nbsp;")
    field.presence || default.html_safe
  end

end
