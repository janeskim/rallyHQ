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
            <input type="checkbox" className="legislator_contact" />
            <div className="legislator_contact">
              <p>{legislator.title} {legislator.first_name} {legislator.last_name}</p>
              <p>{legislator.phone}</p>
            </div>
          </div>
        )
    });

    return(
      <div> {legislators} </div>
    )
  }

});
