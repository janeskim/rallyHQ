var Campaign = React.createClass({

  getInitialState() {
    return {
      legislators: []
    }
  },

  render() {
    var campaignId = this.props.campaign_id;
    return (
      <div>
        <CampaignBill campaignId={campaignId} />
        <CampaignLegislators campaignId={campaignId} />
      </div>
    )
  }
});

