ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.start_with? "<label"
    class_attr_index = html_tag.index 'class="'
    if class_attr_index
      html_tag.insert class_attr_index+7, 'error '
    else
      html_tag.insert html_tag.index('>'), ' class="error"'
    end
  else
    html_tag
  end
end
