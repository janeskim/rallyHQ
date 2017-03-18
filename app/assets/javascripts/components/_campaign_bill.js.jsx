var CampaignBill = React.createClass({

  getInitialState() {
    return {
      campaignId: this.props.campaignId,
      bill: {}
    }
  },

  componentDidMount() {
    $.getJSON(
      '/api/v1/campaigns/' + this.state.campaignId + '/bill.json', (response) =>
        { this.setState(Object.assign({}, this.state, { bill: response })) }
    );
  },

  render() {
    return(
      <div> 
        <h3>{ this.state.bill.short_title }</h3>
      </div>
    )
  }

});