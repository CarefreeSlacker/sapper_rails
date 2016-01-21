var GameField = React.createClass({
  create_row: function(y) {
      var result = [];
      for(var x = 0; x < this.props.fields_width; x++){
          var cell_opened = this.props.cells[x][y][0];
          var cell_value = this.props.cells[x][y][1];
          var cell_id = this.props.cells[x][y][2];
          result.push(React.createElement(GameField.Cell, { x: x,
                                                            y: y,
                                                            opened: cell_opened,
                                                            cell_id: cell_id,
                                                            value: cell_value,
                                                            onClick: this.handleClick.bind(this, cell_id),
                                                            key: cell_id }));
      }
      return <tr y={ y }> { result } </tr>;
  },
  handleClick: function(cell_id){
      $.ajax({
          url: '/check_cells?id=' + cell_id,
          method: 'POST',
          dataType: 'json'
      });
      console.log('click has been handled');
      this.render();
  },
  render: function() {
      var result = [];
      for(var y = 0; y < this.props.fields_height; y++){
          result.push(this.create_row(y));
      }
      return <table class="sapper" style={{ borderColor: '#000000', borderCollapse: 'collapse' }}> { result } </table>;
  }
});

GameField.Cell = React.createClass({
    get_cell_picture: function() {
        if(this.props.opened && this.props.value > 0){
            return this.props.value;
        }else{stream
            return '';
        }
    },
    get_cell_style: function(cell_opened, cell_value) {
        var cell_style = {
            height: '40px',
            width: '40px',
            border: '1px solid black',
            textAlign: 'center'
        }
        if(this.props.opened)
        {
            switch(this.props.value){
                case -1: cell_style.backgroundColor = '#730E15'
                    break;
                case 0: cell_style.backgroundColor = '#ffffff'
                    break;
                default: cell_style.backgroundColor = '#aaaaaa'
            }
        }
        else
        {
            cell_style.backgroundColor ='#555555'
        }
        return cell_style;
    },
    render: function(){
        return <td style={ this.get_cell_style() } key={ this.props.key }>{ this.get_cell_picture() }</td>;
    }})

