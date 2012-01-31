jQuery ->
  $('#flash_messages div').delay(3000).animate {
    opacity: 0,
    height: 0,
    top: '-=30px'
  }, 2000, =>
    $(this).remove

  $('table.listview tr').mouseover ->
    $(this).addClass 'highlighted'

  $('table.listview tr').mouseout ->
    $(this).removeClass 'highlighted'

