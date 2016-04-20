var PiecesList = React.createClass({

  getInitialState(){
    return {
      pieces: [],
      categories: [],
      maxEntries: 48,
      isLoaded: false
    }
  },

  pieces: [],

  componentWillMount(){
    this.fetchPieces(true);
  },

  componentDidMount(){
    this.fetchPieces(true);
  },

  componentWillUnmount(){
  },

  fetchPieces(myBoolean){
    var component = this;
    var searchParams = window.location.search;
    var url = "/api/pieces.json/" + searchParams;
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        categories: json.categories,
        isLoaded: true,
        pieces: json.pieces
      });
    });
  },

  onCheckClick(myBoolean){
    if ($('#local-only').is(':checked')) {
      myBoolean = false;
    } else if ($('#local-only').not(':checked')) {
      myBoolean = true;
    }
    this.fetchPieces(myBoolean);
  },

  render: function() {
    var component = this;

    if (this.pieces.length > 0) {
      $('.no-results').css('display', 'none');
    } else {
      $('.no-results').css('display', 'block');
    }

    return <div className="">
      <div className="js-options">
        <div className="checkbox">
          <label><input type="checkbox" value="" id="local-only" onClick={component.onCheckClick} />show local art only</label>
        </div>
      </div>
      <div className="container">
        <h2 className="no-results"><em> No results found.</em></h2>
        {this.pieces.slice(0, this.state.maxEntries).map(function(thePiece){
          return <PieceTile key={thePiece.id} piece={thePiece} isLoaded={component.state.isLoaded}/>
        })}
      </div>
    </div>
  }
});
