var Legislator = React.createClass({
  // getInitialState() {
    // return {
    //   selected: false
    // }
  // },

  handleClick(id) {
    const legislator_id = id;
    const token = $('meta[name="csrf-token"]').attr('content');
    const data = { legislator_id: legislator_id, category: 'phone' };

    // console.log('this.selected', this.selected)
    // selected: (d.id === id ? !d.selected : d.selected)
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
      }.bind(this),
      error: function(xhr, status, err) {
      }.bind(this)
    });
  },

  deleteAction(data, token) {
    $.ajax({
      type: 'DELETE',
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