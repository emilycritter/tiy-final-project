var PiecesList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      pieces: [],
      maxEntries: 48,
      isLoaded: false
    }
  },

  componentDidMount(){
    var component = this;
    $('.no-results').css('display', 'none');
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
    if (this.state.pieces.length === 0) {
      $('.no-results').css('display', 'block');
    }

    return <div className="container">
      <h2 className="no-results"><em> No results found.</em></h2>
      {this.state.pieces.slice(0, this.state.maxEntries).map(function(thePiece){
        return <PieceTile key={thePiece.id} piece={thePiece} isLoaded={component.state.isLoaded}/>
      })}
    </div>

    ;
  }
});
