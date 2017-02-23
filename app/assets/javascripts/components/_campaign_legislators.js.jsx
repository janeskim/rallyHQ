var CampaignLegislators = React.createClass({

  getInitialState() {
    return {
      legislators: []
    }
  },

  componentDidMount() {
    var campaignId = this.props.campaignId;

    $.getJSON('/api/v1/campaigns/' + campaignId + '/legislators.json', (response) =>
      { this.setState({ legislators: response })
    });
  },

  render() {
    var legislators = this.state.legislators.map((legislator) =>
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
