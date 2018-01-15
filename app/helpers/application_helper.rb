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

  def cap_name_i(user, friends)
    if user == current_user
      return 'You' if user.name.blank?
      user.name.titleize
    else
      if (!user.visibility && !friends)|| user.name.blank?
        return 'Anonymous'
      end
      user.name.titleize
    end
  end

  def cap_city_i(user, friends)
    if user == current_user
      return 'World' if user.city.blank?
      user.city.titleize
    else
      if (!user.visibility && !friends)|| user.city.blank?
        return 'World'
      end
      user.city.titleize
    end
  end

  def cap_city(user)
    if user == current_user
      return 'World' if user.city.blank?
      user.city.titleize
    else
      if !user.visibility || user.city.blank?
        return 'World'
      end
      user.city.titleize
    end
  end

  def cap_age(user, friends)
    if user == current_user
      return 'Age' if user.age.blank?
      user.age
    else
      if (!user.visibility && !friends)|| user.age.blank?
        return 'Age'
      end
      user.age
    end
  end

  def cap_gender(user, friends)
    if user == current_user
      return 'Gender' if user.gender.blank?
      user.gender == "m" ? "Male" : "Female"
    else
      if (!user.visibility && !friends)|| user.gender.blank?
        return 'Gender'
      end
      user.gender == "m" ? "Male" : "Female"
    end
  end

  def cap_phone_i(user, friends)
    if user == current_user
      return 'Hidden number' if user.phone.blank?
      user.phone
    else
      if (!user.visibility && !friends)|| user.phone.blank?
        return 'Hidden number'
      end
      user.phone
    end
  end

  def cap_phone(user)
    if user == current_user
      return 'Hidden number' if user.phone.blank?
      user.phone
    else
      if !user.visibility || user.phone.blank?
        return 'Hidden number'
      end
      user.phone
    end
  end

  def cap_email_i(user, friends)
    if user == current_user
      return 'Hidden Email' if user.email.blank?
      user.email
    else
      if (!user.visibility && !friends)|| user.email.blank?
        return 'Hidden Email'
      end
      user.email
    end
  end

  def cap_email(user)
    if user == current_user
      return 'Hidden Email' if user.email.blank?
      user.email
    else
      if !user.visibility || user.email.blank?
        return 'Hidden Email'
      end
      user.email
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
