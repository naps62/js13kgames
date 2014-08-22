class Builder
  @attrs:
    class: 'className'
    id: 'id'

  constructor: (tagName, options) ->
    @el = document.createElement(tagName)
    options.each @attr

  addClass: (className) =>
    @appendTo('class', className)
    return @

  removeClass: (className) =>
    @removeFrom('class', new RegExp(" ?#{className}"))

  attr: (attr, value) =>
    attrName = Builder.attrs[attr]
    @el[attrName] = value if attrName

  appendChild: (child) =>
    @el.appendChild(child)

  render: =>
    return @el

  # private

  appendTo: (attr, value) =>
    attrName = Builder.attrs[attr]
    @el[attrName] ||= ""
    @el[attrName] += " #{value}"
    return @

  removeFrom: (attr, value) =>
    attrName = Builder.attrs[attr]
    @el[attrName] = @el[attrName].replace(value, '')
    return @
