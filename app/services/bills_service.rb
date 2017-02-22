module BillsService

  def self.find_or_create(record)
    bill = Bill.find_by(api_id: record['bill_id']) || Bill.new
    bill.vote_id        = record['vote_id']
    bill.short_title    = record['short_title']
    bill.api_id         = record['bill_id']
    bill.bill_type      = record['bill_type']
    bill.number         = record['number']
    bill.chamber        = record['chamber']
    bill.introduced_on  = record['introduced_on']
    bill.last_action_at = record['last_action_at']
    bill.save

    find_or_create_result(bill, record) if record.has_key?('history')
    find_or_create_sponsors(bill, record) if record.has_key?('sponsors')
    find_or_create_committees(bill, record) if record.has_key?('committee_ids')
  end

  def self.find_or_create_result(bill, record)
    attrs = record['history']
    if archive = bill.archive
      archive.update(attrs)
    else
      archive = Archive.create(attrs)
      bill.archive = archive
    end
  end

  def self.find_or_create_sponsor(bill, record)
    sponsor_bioguide_id = record['sponsor_id']
    if legislator = Legislator.find_by(bioguide_id: sponsor_bioguide_id)
      legislator.bills << bill if legislator.bills.exclude?(bill)
    else
      legislator_data = CongressApiService.fetch_legislator(sponsor_bioguide_id).first
      legislator = LegislatorsService.find_or_create(legislator_data.first)
      legislator.bills << bill if legislator.bills.exclude?(bill)
    end
  end

  def self.find_or_create_committees(bill, record)
    committee_ids = record['committee_ids']
    committee_ids.each do |committee_id|
      committee = CommitteesService.find_or_create(committee_id)
      committee.bills << bill if committee.bills.exclude?(bill)
      LegislatorsService.find_or_create_by_committee(committee)
      committee.legislators.each { |legislator| legislator.bills << bill if legislator.bills.exclude?(bill) }
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