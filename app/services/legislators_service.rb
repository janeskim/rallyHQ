module LegislatorsService

  def self.display_name(record)
    return "#{record["title"]}. #{record["first_name"]} #{record["last_name"]}"
  end

  def self.display_date(datestring)
    return nil unless datestring
    date = DateTime.parse(datestring)
    return date.strftime('%-m/%-d/%Y')
  end

end