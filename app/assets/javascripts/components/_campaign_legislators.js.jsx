var CampaignLegislators = React.createClass({

  getInitialState() {
    return {
      campaignId: this.props.campaignId,
      legislators: []
    }
  },

  componentDidMount() {
    const campaignId = this.state.campaignId;

    $.getJSON(
      '/api/v1/campaigns/' + campaignId + '/legislators.json', (response) =>
        { this.setState(Object.assign({}, this.state, {legislators: response})) }
    );
  },

  render() {
    const legislators = this.state.legislators.map((legislator) =>
      { return (
        <div key={legislator.id}>
          <Legislator legislator={legislator} />
        </div>
      )
    });

    return (
      <div>
        { legislators }
      </div>
    )
  }
});
