var MapDisplay = React.createClass({

  getInitialState(){
    return {
      artists: this.props.artists,
      latitude: '',
      longitude: ''
    }
  },

  componentDidMount(){
    var component = this;
    var mymap = L.map('mapid');

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: 'emilycritter.pia1bd72',
      accessToken: 'pk.eyJ1IjoiZW1pbHljcml0dGVyIiwiYSI6ImNpbWdmZXhmYzAyMDV1NGx2bHM0MTNzNGYifQ.7KYzLItfXBfg5Zs-757BGw'
    }).addTo(mymap);

    mymap.locate({setView: true, maxZoom: 11});

    function onLocationFound(e) {
      var radius = e.accuracy / 2;
      if (component.isMounted()) {
        component.setState({
          latitude: e.latlng.lat.toFixed(5),
          longitude: e.latlng.lng.toFixed(5)
        });
      };

      L.marker(e.latlng).addTo(mymap)
          .bindPopup("<b>Current Location</b>(" + component.state.latitude + ", " + component.state.longitude + ")").openPopup();
      L.circle(e.latlng, radius).addTo(mymap);
    }

    mymap.on('locationfound', onLocationFound);
    function onLocationError(e) {
        alert(e.message);
    }

    mymap.on('locationerror', onLocationError);

    this.state.artists.map(function(artist){
      L.marker([artist.latitude, artist.longitude]).addTo(mymap)
        // .bindPopup('<b>' + artist.shop_name+ '</b>' + artist.location + '<br/><img src="' + artist.photo_url + '"/>' + '<br/><a href="' + artist.artist_url + '">View Shop</a>');
        .bindPopup('<b>' + artist.shop_name+ '</b>' + artist.location);
    });

  },

  render: function() {
    return <div id="mapid"></div>;
  }

});
