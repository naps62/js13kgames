class Tile
  @FIRE: 'fire'
  @WATER: 'water'
  @EARTH: 'earth'
  @AIR:   'air'

  constructor: (@x, @y) ->
    @state = Tile.FIRE
    @id = "tile-#{@x}-#{@y}"
    @el = new Builder 'div',
      id: @id
      class: 'tile'
    @el.addClass(@state)

  render: =>
    return @el.render()

  unselect: =>
    @el.removeClass('selected')

  select: =>
    @el.addClass('selected')

  onclick: (callback) => @el.el.onclick = callback
