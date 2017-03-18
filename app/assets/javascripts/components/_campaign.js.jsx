var Campaign = React.createClass({

  getInitialState() {
    return {
      campaignId: this.props.campaign_id
    }
  },

  render() {
    return (
      <div>
        <CampaignBill campaignId={this.state.campaignId} />
        <CampaignLegislators campaignId={this.state.campaignId} />
      </div>
    )
  },

});
