// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function voteForPokemon(url, rating){
  $.ajax({
    beforeSend: function(xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token', 
        $('meta[name="csrf-token"]').attr('content'))},
    url: url + '?rating=' + rating,
    type: "PUT",
    contentType: "application/javascript",
  });
}

function addTeam(ids){
  $.ajax({
    beforeSend: function(xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token', 
        $('meta[name="csrf-token"]').attr('content'))},
    url: '/pokemon_teams' + '?pokemon_ids=' + ids,
    type: "POST",
    contentType: "application/javascript",
  });
}

function addPoke(ids){
  $.ajax({
    beforeSend: function(xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token', 
        $('meta[name="csrf-token"]').attr('content'))},
    url: '/user_pokemons' + '?pokemon_ids=' + ids,
    type: "POST",
    contentType: "application/javascript",
  });
}

function joinTour(id){
  $.ajax({
    beforeSend: function(xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token', 
        $('meta[name="csrf-token"]').attr('content'))},
    url: '/team_tournaments'+ '?tour_id=' + id,
    type: "GET",
    contentType: "application/javascript",
  });
}
