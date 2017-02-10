class CampaignsController < ApplicationController
  
  def beta
    @campaigns = Campaign.all
  end

end


# def index; end
# def show; end
# def new; end
# def create; end
# def edit; end
# def update; end
# def destroy; end
