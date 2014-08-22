class Selector
  constructor: (@game) ->
    @w = @game.w
    @h = @game.h
    @x = null
    @y = null

  start: =>
    @handles()

  onUpdate: (callback) =>
    @updateCallback = callback

  update: (x, y) =>
    @x = x
    @y = y
    @updateCallback(@x, @y) if !!@updateCallback

  left: =>
    @update((@x || @w) - 1, @y)

  right: =>
    @update((@x || 0) + 1, @y)

  up: =>
    @update(@x, (@y || @h) - 1)

  down: =>
    @update(@x, (@y || 0) + 1)

  handles: =>
    # TODO window.onmousemove
    console.log 'handles', @game.board.tiles
    @game.board.tiles.each (tile) =>
      tile.onclick =>
        @update(tile.x, tile.y)
