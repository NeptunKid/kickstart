dropdown = () ->

  # The following should apply to both navigation elements and dropdown buttons

  $menuItems = k$.$$ '.menu-item'

  for $_menuItem in $menuItems

    $menuItem = $_menuItem.cloneNode true
    $_menuItem.parentNode.replaceChild $menuItem, $_menuItem

    do ($menuItem) ->
      # TODO: Is there a way we could not have an event listener for every
      # single one?
      $menuItem.addEventListener 'click', (e) ->

        # Just close it if it's already open
        if $menuItem.classList.contains 'open'
          $menuItem.classList.remove 'open'
          return

        # Reset all
        _$menuItem.classList.remove 'open' for _$menuItem in document.querySelectorAll('.menu-item')
        $openable = $menuItem.querySelector 'ul'
        $openable = true if $menuItem.querySelector('a').dataset.link

        # Open this one
        if $openable
          $menuItem.classList.add 'open'

        # Prevent bubbling
        e.stopPropagation()

  # Dismiss all
  document.body.addEventListener 'click', ->
    $ul.parentNode.classList.remove 'open' for $ul in k$.$$('.menu-item > ul')
    $li.classList.remove 'open' for $li in k$.$$('.menu-item.open')

k$.dropdown = dropdown

module.exports = dropdown
