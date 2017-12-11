module ApplicationHelper
  def cap_name(user)
    if user == current_user
      return 'You' if user.name.blank?
      user.name.titleize
    else
      if !user.visibility || user.name.blank?
        return 'Anonymous'
      end
      user.name.titleize
    end
  end

  def cap_city(user)
    if user == current_user
      return 'World' if user.name.blank?
      user.city.titleize
    else
      if !user.visibility || user.city.blank?
        return 'World'
      end
      user.city.titleize
    end
  end

  def format_date(date)
    date.to_formatted_s(:rfc822)
  end

  def get_status(status)
    statuses = ['Owned', 'For sale', 'For gift', 'For rent', 'Rented']
    statuses[status]
  end
end
