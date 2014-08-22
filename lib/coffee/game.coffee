class Game
  constructor: (@w, @h) ->
    @board = new Board(@w, @h)
    @container = $('container')
    @selector = new Selector(this)
    @currentTile = null
    @start()

  start: =>
    @render()
    @selector.onUpdate(@selectTile)
    @selector.start()

  selectTile: (x, y) =>
    @currentTile.unselect() if !!@currentTile
    @currentTile = @board.tile(x, y)
    @currentTile.select()

  render: =>
    # @container.innerHTML = ''
    @container.appendChild(@board.render())
