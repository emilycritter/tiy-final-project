var PiecesList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      pieces: []
    }
  },

  componentDidMount(){
    var component = this;
    component.fetchPieces()
    this.autoUpdatingInterval = setInterval(function(){
      component.fetchPieces()
    }, 3000)
  },

  componentWillUnmount(){
    clearInterval(this.autoUpdatingInterval)
  },

  fetchPieces(){
    var component = this;
    fetch("/api/pieces.json")
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        pieces: json.pieces
      })
    })
  },

  render: function() {
    return <div className="container">
      {this.state.pieces.map(function(thePiece){
        return <PieceTile key={thePiece.id} piece={thePiece} />
      })}
    </div>

    ;
  }
});
