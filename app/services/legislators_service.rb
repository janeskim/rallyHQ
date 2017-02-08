module LegislatorsService

  def self.find_or_create(record)
    if legislator = Legislator.find_by(bioguide_id: record['bioguide_id'])
      return legislator
    else
      legislator              = Legislator.new
      legislator.first_name   = record['first_name']
      legislator.last_name    = record['last_name']
      legislator.party        = record['party']
      legislator.title        = record['title']
      legislator.state        = record['state']
      legislator.chamber      = record['chamber']
      legislator.phone        = record['phone']
      legislator.website      = record['website']
      legislator.address      = record['address']
      legislator.bioguide_id  = record['bioguide_id']
      legislator.govtrack_id  = record['govtrack_id']
      legislator.thomas_id    = record['thomas_id']
      legislator.in_office    = record['in_office']
      legislator.term_start   = create_date(record['term_start'])
      legislator.term_end     = create_date(record['term_end'])
      legislator.save
      return legislator
    end
  end

  def self.find_or_create_by_committee(committee)
    committee_members_data = CongressApiService.fetch_committee_members(committee.api_id).first
    committee_members_data['members'].each do |data|
      next unless legislator_data = data['legislator']
      legislator = find_or_create(legislator_data)
      legislator.committees << committee if legislator.committees.exclude?(committee)
    end
  end

  def self.create_date(datestring)
    return if !datestring
    split_string = datestring.split('-').map(&:to_i)
    year  = split_string[0]
    month = split_string[1]
    day   = split_string[2]
    Date.new(year, month, day)
  end

  def self.display_name(record)
    return "#{record["title"]}. #{record["first_name"]} #{record["last_name"]}"
  end

  def self.display_date(datestring)
    return nil unless datestring
    date = DateTime.parse(datestring)
    return date.strftime('%-m/%-d/%Y')
  end

end