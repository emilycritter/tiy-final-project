var PieceTile = React.createClass({

  render(){

    var piece = this.props.piece;

    var pieceTitleTruncate = function(title){
      if (title.length > 60) {
        return title.substring(0,60)+'...'
      } else {
        return title
      }
    };

    return <div className="flip-container">
      <a href={piece.piece_url}>
        <div className="card img-responsive" id="{piece.id}">
          <div className="front">
              <img src={piece.photo_url} className="img-responsive my-img" />
              <div className="price">{piece.price_formatted}</div>
          </div>
          <div className="back">
              <h4>{pieceTitleTruncate(piece.title)}</h4>
              <h5>By: {piece.artist.shop_name}</h5>
              <h5>{piece.price_formatted}</h5>
          </div>
        </div>
      </a>
    </div>

  }
});
