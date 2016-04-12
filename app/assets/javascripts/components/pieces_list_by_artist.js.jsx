var PiecesListByArtist = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      artist: '',
      artist_id: this.props.data,
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
    var lastParameter = this.state.artist_id;
    var url = "/api/artists/"+lastParameter+".json";
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        artist: json.artist,
        pieces: json.artist.pieces
      })
    })
  },

  render: function() {
    var addArtworkStyle = {
      display: 'flex',
      justifyContent: 'center',
      alignContent: 'center'
    };
    return <div className="container">

      {this.state.pieces.map(function(thePiece){
        return <PieceTile key={thePiece.id} piece={thePiece} />
      })}
    </div>

    ;
  }
});
