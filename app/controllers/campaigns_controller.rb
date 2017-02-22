class CampaignsController < ApplicationController
  
  def beta
    @campaigns = Campaign.all
  end

end
