module ProductsHelper

  #
  # Sets the value to be shown on view.
  #
  # @param [String] field the actual model attribute value.
  # @param [String] default the value that should be returned
  #                 in case of the field is empty.
  #
  # @return [String] the value to be shown on view.
  #
  def get_value(field, default = "&nbsp;")
    field.presence || default.html_safe
  end

end
