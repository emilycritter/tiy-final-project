var MapDisplay = React.createClass({

  getInitialState(){
    return {
      artists: this.props.artists,
      currentUser: this.props.current_user,
      latitude: '',
      longitude: '',
      errors: {}
    }
  },

  componentDidMount(){
    var component = this;
    var mymap = L.map('mapid').setView([29.73, -95.39], 13);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: 'emilycritter.pia1bd72',
      accessToken: 'pk.eyJ1IjoiZW1pbHljcml0dGVyIiwiYSI6ImNpbWdmZXhmYzAyMDV1NGx2bHM0MTNzNGYifQ.7KYzLItfXBfg5Zs-757BGw'
    }).addTo(mymap);

    this.state.artists.map(function(artist){
      L.marker([artist.latitude, artist.longitude]).addTo(mymap)
        // .bindPopup('<b>' + artist.shop_name+ '</b>' + artist.location + '<br/><img src="' + artist.photo_url + '"/>' + '<br/><a href="' + artist.artist_url + '">View Shop</a>');
        .bindPopup('<b>' + artist.shop_name+ '</b>' + artist.location);
    });

    mymap.locate({setView: true, maxZoom: 13});
    function onLocationFound(e) {
      var radius = e.accuracy / 2;
      component.setState({
        latitude: e.latlng.lat.toFixed(5),
        longitude: e.latlng.lng.toFixed(5)
      });

      L.marker(e.latlng).addTo(mymap)
          .bindPopup("<b>Current Location</b>(" + component.state.latitude + ", " + component.state.longitude + ")").openPopup();
      L.circle(e.latlng, radius).addTo(mymap);

      component.updateUserLocation(component.state.latitude, component.state.longitude);
    }

    mymap.on('locationfound', onLocationFound);
    function onLocationError(e) {
        alert(e.message);
    }

    mymap.on('locationerror', onLocationError);


  },

  updateUserLocation(newLat, newLon){
    var component = this;
    if (this.state.currentUser.id) {

      var path = window.location.pathname;
      var url = "/api/users/location/" + this.state.currentUser.id;

      var params = {
        user: {
          latitude: newLat,
          longitude: newLon
        }
      };
      console.log("params " + JSON.stringify(params));

      fetch(url, {
        method: 'put',
        headers: {
         "Content-type": "application/json"
        },
        credentials: 'include',
        body: JSON.stringify(params)
      })
      .then(function(response){
        console.log(response)
        return response.json();
      })
      .then(function(data){
        console.log(data)
        if (data.errors){
          component.setState({
            errors: data.errors
          })
          console.log(component.errors);
        } else {
          window.location = path
        }
      })
    }
  },

  render: function() {
    return <div id="mapid"></div>;
  }

});
