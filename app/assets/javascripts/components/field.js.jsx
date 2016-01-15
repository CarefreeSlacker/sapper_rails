var GameField = React.createClass({
  create_row: function() {
      var result = [];
      for(var i = 0; i < this.props.fields_width; i++){
          result.push(this.create_cell());
      }
      return <tr>{ result }</tr>;
  },
  create_cell: function() {
      return <td>Win!</td>
      /* <td class={ this.props.class } cell-id={ this.props.id }>
          { this.props.cell_picture }
      </td>; */
  },
  render: function() {
      var result = [];
      for(var i = 0; i < this.props.fields_height; i++){
          result.push(this.create_row());
      }
      return <table> { result } </table>;
  }
});