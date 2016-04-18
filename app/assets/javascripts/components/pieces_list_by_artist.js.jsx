var PiecesListByArtist = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      artist: '',
      pieces: [],
      artistId: this.props.data,
      maxEntries: this.props.max_entries,
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
    var lastParameter = this.state.artistId;
    var url = "/api/artists/"+lastParameter+".json";
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        artist: json.artist,
        pieces: json.artist.pieces,
        isLoaded: true
      })
    })
  },

  render: function() {
    var component = this;
    var addArtworkStyle = {
      display: 'flex',
      justifyContent: 'center',
      alignContent: 'center'
    };

    return <div className="container">

      {this.state.pieces.slice(0, this.state.maxEntries).map(function(thePiece){
        return <PieceTile key={thePiece.id} piece={thePiece} isLoaded={component.state.isLoaded}/>
      })}
    </div>

    ;
  }
});
