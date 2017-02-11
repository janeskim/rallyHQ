var Campaign = React.createClass({

  componentWillMount () {
    var campaignId = this.props.campaign_id;
    this.state = {campaignId: campaignId};
  },

  render() {
    var campaignId = this.state.campaignId;
    return (
      <div>
        <CampaignBill campaignId={campaignId} />
        <CampaignLegislators campaignId={campaignId} />
      </div>
    )
  }
});

