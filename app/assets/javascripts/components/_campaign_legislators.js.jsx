var CampaignLegislators = React.createClass({

  getInitialState() {
    return {
      legislators: []
    }
  },

  componentDidMount() {
    var campaignId = this.props.campaignId,
        checklistId = this.props.checklistId;

    $.getJSON('/api/v1/campaigns/' + campaignId + '/legislators.json', (response) =>
      { this.setState({ legislators: response })
    });
  },

  handleClick() {
    var legislatorId = this.refs.legislatorId.value,
        checklistId = this.props.checklistId,
        token = $('meta[name="csrf-token"]').attr('content'),
        data = {legislator_id: legislatorId, checklist_id: checklistId, category: 'phone'};

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
              ref="legislatorId"
              value={legislator.id}
              onClick={this.handleClick} />
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
