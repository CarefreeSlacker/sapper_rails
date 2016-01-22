var GameField = React.createClass({
  create_row: function(y) {
      var result = [];
      for(var x = 0; x < this.props.fields_width; x++){
          var cell_opened = this.props.cells[x][y][0];
          var cell_value = this.props.cells[x][y][1];
          var cell_id = this.props.cells[x][y][2];
          result.push(this.create_cell({ x: x,
                                         y: y,
                                         opened: cell_opened,
                                         cell_id: cell_id,
                                         value: cell_value }));
      }
      return <tr y={ y }> { result } </tr>;
  },
  handleClick: function(cell_id){
      $.post({
          url: '/check_cells?id=' + cell_id,
          dataType: 'json' });
      // table does not refreshed after sending POST request
  },
  get_cell_style: function(cell_properties) {
      var cell_style = 'table_cell ';
      if(cell_properties.opened)
      {
          switch(cell_properties.value){
              case -1: cell_style += 'bomb'
                  break;
              case 0: cell_style += 'empty'
                  break;
              default: cell_style += 'numbers'
          }
      }
      else
      {
          cell_style += 'closed'
      }
      return cell_style;
  },
  get_cell_picture: function(cell_properties) {
      if(cell_properties.opened && cell_properties.value > 0){
          return cell_properties.value;
      }else{
          return '';
      }
  },
  create_cell: function(cell_properties){
      return <td className={ this.get_cell_style(cell_properties) }
                 key={ cell_properties.cell_id }
                 onClick={ this.handleClick.bind(this, cell_properties.cell_id) }>{ this.get_cell_picture(cell_properties) }</td>;
  },
  render: function() {
      var result = [];
      for(var y = 0; y < this.props.fields_height; y++){
          result.push(this.create_row(y));
      }
      return <table className="sapper"> { result } </table>;
  }
});

