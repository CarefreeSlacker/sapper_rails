var GameField = React.createClass({
  create_row: function(y) {
      var result = [];
      for(var x = 0; x < this.props.fields_width; x++){
          result.push(this.create_cell(x, y));
      }
      return <tr y={ y }> { result } </tr>;
  },
  create_cell: function(x, y) {
      return <td x={ x } y={ y }>{ this.props.cells[x][y][1] }</td>
  },
  render: function() {
      var result = [];
      for(var y = 0; y < this.props.fields_height; y++){
          result.push(this.create_row(y));
      }
      return <table> { result } </table>;
  }
});