Array.prototype.each = (callback) ->
  result = []
  result.push(callback(elem)) for elem in this
  return result
Array.prototype.map = Array.prototype.each

Object.prototype.each = (callback) ->
  keys = Object.keys(this)
  result = {}
  for key in keys
    result[key] = callback(key, this[key])
  return result
Object.prototype.map = Object.prototype.each

Object.prototype.keys = ->
  Object.keys(@)
