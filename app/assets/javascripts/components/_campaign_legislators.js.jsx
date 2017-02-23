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

  handleClick(id) {
    const legislator_id = id;
    const token = $('meta[name="csrf-token"]').attr('content');
    const data = { legislator_id: legislator_id, category: 'phone' };

    $.ajax({
      type: 'POST',
      url: '/api/v1/actions.json',
      data: JSON.stringify(data),
      dataType: 'json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', token);
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.setRequestHeader('Content-Type', 'application/json');
      },
      success: function(data) {
      }.bind(this),
      error: function(xhr, status, err) {
      }.bind(this)
    });
  },

  render() {
    var legislators = this.state.legislators.map((legislator) =>
      { return (
          <div key={legislator.id}>
            <input type="checkbox"
              className="legislator_contact"
              onClick={this.handleClick.bind(this, legislator.id)} />
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
