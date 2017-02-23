var Campaign = React.createClass({

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

