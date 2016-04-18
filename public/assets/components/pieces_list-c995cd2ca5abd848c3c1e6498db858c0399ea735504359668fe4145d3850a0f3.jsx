var PiecesList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      pieces: [],
      isLoaded: false
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
    var searchParams = window.location.search;
    var url = "/api/pieces.json/" + searchParams;
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        pieces: json.pieces,
        isLoaded: true
      })
    })
  },

  render: function() {
    var component = this;
    return <div className="container">
      {this.state.pieces.map(function(thePiece){
        return <PieceTile key={thePiece.id} piece={thePiece} isLoaded={component.state.isLoaded}/>
      })}
    </div>

    ;
  }
});
