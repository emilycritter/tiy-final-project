var PiecesList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      pieces: [],
      nearbyPieces: [],
      categories: [],
      maxEntries: 48,
      isLoaded: false
    }
  },

  componentDidMount(){
    var component = this;
    $('.no-results').css('display', 'none');
    component.fetchPieces();
    this.autoUpdatingInterval = setInterval(function(){
      component.fetchPieces()
    }, 5000);
  },

  componentWillUnmount(){
    clearInterval(this.autoUpdatingInterval)
  },

  onButtonClick(){
    var component = this;
    $('.dropdown-menu li a').click(function(){
      var selectedCategory = $(this).text();
      $(this).closest('div').find('button[data-toggle="dropdown"]').html(selectedCategory+' <span class="caret"></span>');
      var selectedPieces = component.state.pieces.filter(function(piece){
        return piece.category_string.indexOf(selectedCategory) > -1;
      });
      if (selectedPieces.length !== component.state.pieces.length && selectedPieces.length !== 0) {
        component.setState({
          pieces: selectedPieces
        });
        clearInterval(component.autoUpdatingInterval);
      }
      console.log(selectedCategory);
      console.log(component.state.pieces);
      console.log(selectedPieces);
    });
  },

  onCheckClick(){
    var component = this;
    if ($('#local-only').is(':checked')){
      if (component.state.nearby_pieces) {
        component.setState({
          pieces: component.state.nearby_pieces
        })
      } else {
        component.setState({
          pieces: []
        })
      }
    }
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
        nearbyPieces: json.nearby_pieces,
        categories: json.categories,
        isLoaded: true
      })
    });
  },

  render: function() {
    var component = this;

    if (this.state.pieces.length === 0) {
      $('.no-results').css('display', 'block');
    } else {
      $('.no-results').css('display', 'none');
    }

    return <div className="">
      <div className="js-options">
        <div className="checkbox">
          <label><input type="checkbox" value="" id="local-only" onClick={component.onCheckClick}/>show local art only</label>
        </div>
        <div className="dropdown">
          <button onClick={component.onButtonClick} className="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            Select category &nbsp;
            <span className="caret"></span>
          </button>
          <ul className="dropdown-menu" aria-labelledby="dropdownMenu1">
            {this.state.categories.map(function(theCategory){
              return <li key={theCategory.id}><a href="#">{theCategory.name}</a></li>
            })}
          </ul>
        </div>
      </div>
      <div className="container">
        <h2 className="no-results"><em> No results found.</em></h2>
        {this.state.pieces.slice(0, this.state.maxEntries).map(function(thePiece){
          return <PieceTile key={thePiece.id} piece={thePiece} isLoaded={component.state.isLoaded}/>
        })}
      </div>
    </div>

    ;
  }
});
