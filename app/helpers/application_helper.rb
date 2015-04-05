module ApplicationHelper
  
  # Set CSS class for error visuals on div elements with class 'form-group'
  def error_check_tag(errors)
    if errors.any?
      'has-error'
    end
  end
  
end
