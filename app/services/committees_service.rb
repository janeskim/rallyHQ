module CommitteesService

  def self.find_or_create(api_id)
    if committee = Committee.find_by(api_id: api_id)
      return committee
    else
      committee_data    = CongressApiService.fetch_committee(api_id)
      committee         = Committee.new
      committee.api_id  = congress_data['api_id']
      committee.name    = congress_data['name']
      committee.phone   = congress_data['phone']
      committee.save
      return committee
    end
  end

end