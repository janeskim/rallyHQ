var Legislator = React.createClass({

  getInitialState() {
    return {
      selected: false,
      actionId: ''
    }
  },

  createAction(data, token) {
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
        this.setState(Object.assign({}, this.state, {
          actionId: data.id
        }));
      }.bind(this),
      error: function(xhr, status, err) {
        console.log("create failure");
      }.bind(this)
    });
  },

  deleteAction(data, token) {
    $.ajax({
      type: 'DELETE',
      url: '/api/v1/actions/' + this.state.actionId,
      data: JSON.stringify(data),
      dataType: 'json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', token);
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.setRequestHeader('Content-Type', 'application/json');
      },
      success: function(data) {
        this.setState(Object.assign({}, this.state, {
          actionId: ''
        }));
      }.bind(this),
      error: function(xhr, status, err) {
        console.log("delete failure");
      }.bind(this)
    });
  },

  handleClick(id) {
    const legislator_id = id;
    const data = { legislator_id: legislator_id, category: 'phone' };
    const token = $('meta[name="csrf-token"]').attr('content');

    this.state.selected = !this.state.selected;
    if (this.state.selected) {
      this.createAction(data, token)
    } else {
      this.deleteAction(data, token)
    };
  },

  render() {
    var legislator = this.props.legislator;

    return (
      <div >
        <input type="checkbox"
          className="legislator_contact"
          onClick={this.handleClick.bind(this, legislator.id)} />
        <div className="legislator_contact">
          <p>{legislator.title} {legislator.first_name} {legislator.last_name}</p>
          <p>{legislator.phone}</p>
        </div>
      </div>
    )
  }

});