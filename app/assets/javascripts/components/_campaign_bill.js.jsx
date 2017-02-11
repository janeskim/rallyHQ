var CampaignBill = React.createClass({

  getInitialState() {
    return {
      bill: {}
    }
  },

  componentDidMount() {
    var campaignId = this.props.campaignId;

    $.getJSON('/api/v1/campaigns/' + campaignId + '/bill.json', (response) => 
      { this.setState({ bill: response });
    });
  },

  render() {
    var bill = this.state.bill;
    return(
      <div> 
        <h3>{ bill.short_title }</h3>
      </div>
    )
  }

});