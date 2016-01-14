# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  listen_to_cell_click()

listen_to_cell_click = ->
  $('#field table.sapper td.table_cell').click ->
    return if $('td.game_status').hasClass('game_won') or $('td.game_status').hasClass('game_lost')
    cell_id = @.attributes['cell-id'].nodeValue
    $.ajax
      url: "/check_cells?id=#{cell_id}"
      method: 'POST'
      dataType: 'json'
      success: (data)->
        congratulations(data)
        render_table()
  @

render_table = ->
  $table_field = $('#field')
  $table_field.html('')
  game_id = $table_field.attr('game-id')
  $.ajax
    url: "/games/#{game_id}/edit"
    method: 'GET'
    dataType: 'text'
    success: (data)->
      $table_field.html(data)
      listen_to_cell_click()

congratulations = (data)->
  return if data['still_playing']
  $status_field = $('td.game_status')
  $status_field.removeClass('still_playing')
  $status_field.addClass(data['new_status'])
  $status_field.html(data['new_message'])

