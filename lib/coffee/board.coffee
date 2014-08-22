class Board
  constructor: (@w, @h) ->
    @length = @w * @h
    @reset()
    @el = new Builder 'div',
      id: 'board'

  tile: (x, y) =>
    @tiles[@index(x, y)]

  reset: =>
    @tiles = new Array(@length)
    @tiles.each =>
    [0..@w].each (x) =>
      [0..@h].each (y) =>
        index = @index(x, y)
        @tiles[index] = new Tile(x, y)

  render: =>
    @eachTile (tile) =>
      @el.appendChild(tile.render())
    return @el.render()

  # private

  eachTile: (callback) =>
    @tiles.each (tile) =>
    [0..@w-1].each (x) =>
      [0..@h-1].each (y) =>
        index = @index(x, y)
        callback(@tiles[index], x, y)

  index: (x, y) =>
    x * @h + y
