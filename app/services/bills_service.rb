module BillsService

  def self.find_or_create(record)
    bill = Bill.find_by(api_id: record["bill_id"]) || Bill.new
    bill.vote_id        = record["vote_id"]
    bill.short_title    = record["short_title"]
    bill.bill_type      = record["bill_type"]
    bill.number         = record["number"]
    bill.chamber        = record["chamber"]
    bill.introduced_on  = record["introduced_on"]
    bill.last_action_at = record["last_action_at"]
    bill.save

    find_or_create_associated_result(bill, record) if record.has_key?("history")
  end

  def self.find_or_create_associated_result(bill, record)
    attrs = record["history"]
    if archive = bill.archive
      archive.update(attrs)
    else
      archive = Archive.create(attrs)
      bill.archive = archive
    end
  end

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