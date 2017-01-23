module BillsService

  def self.format_date(datestring)
    return nil unless datestring
    date = DateTime.parse(datestring)
    return date.strftime('%-m/%-d/%Y')    
  end

  def self.is_active?(history)
    return nil unless history
    return history["active"] ? true : false
  end

  def self.sponsor_name(sponsor)
    return nil unless sponsor 
    return "#{sponsor["title"]} #{sponsor["first_name"]} #{sponsor["middle_name"]} #{sponsor["last_name"]} #{sponsor["name_suffix"]}"
  end
end