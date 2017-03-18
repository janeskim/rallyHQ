class Api::V1::CampaignsController < Api::V1::BaseController

  def show
    campaign = Campaign.find(params[:id])
    respond_with(campaign, json: campaign)
  end

  def bill
    campaign = Campaign.find(params[:campaign_id])
    bill = campaign.bill
    respond_with(bill, json: bill)
  end

  def legislators
    campaign = Campaign.find(params[:campaign_id])
    legislators = campaign.bill.legislators
    respond_with(legislators, json: legislators)
  end

end
