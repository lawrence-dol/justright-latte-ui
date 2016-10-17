root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'justright-latte-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'justright-latte-ui.layoutMode', (value) ->
      setLayoutMode(value)

    atom.config.observe 'justright-latte-ui.tabSizing', (value) ->
      setTabSizing(value)

  deactivate: ->
    unsetFontSize()
    unsetLayoutMode()
    unsetTabSizing()

# FONT SIZE
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# LAYOUT MODE
setLayoutMode = (layoutMode) ->
  root.setAttribute('theme-justright-latte-ui-layoutmode', (layoutMode||"Auto"))

unsetLayoutMode = ->
  root.removeAttribute('theme-justright-latte-ui-layoutmode')

# TAB SIZING
setTabSizing = (tabSizing) ->
  root.setAttribute('theme-justright-latte-ui-tabsizing', (tabSizing||"Auto"))

unsetTabSizing = ->
  root.removeAttribute('theme-justright-latte-ui-tabsizing')
