# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# this is the initial script for masonry, below is an updated version for infinite scrolling if I use this instead of the scrip below the normal pagination will occur
#jQuery ->
#	$('#pins').imagesLoaded ->
#		$('#pins').masonry itemSelector: ".box"

$ ->
  
  # Setup drop down menu
  $(".dropdown-toggle").dropdown()
  
  # Fix input element click problem
  $(".dropdown input, .dropdown label").click (e) ->
    e.stopPropagation()

jQuery ->
  $container = $("#pins")
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
      gutterWidth:26
# the columnWidth came with script not sure exactly how but at 50 it only allow three pins with it removed it fills up the container with them may need to remove if a problem arises

  $container.infinitescroll
    navSelector: "#page-nav" # selector for the paged navigation
    nextSelector: "#page-nav a" # selector for the NEXT link (to page 2)
    itemSelector: ".box" # selector for all items you'll retrieve
    loading:
      finishedMsg: "No more pages to load."
      img: "http://i.imgur.com/6RMhx.gif"
  
  # trigger Masonry as a callback
  , (newElements) ->
    
    # hide new items while they are loading
    $newElems = $(newElements).css(opacity: 0)
    
    # ensure that images load before adding to masonry layout
    $newElems.imagesLoaded ->
      
      # show elems now they're ready
      $newElems.animate opacity: 1
      $container.masonry "appended", $newElems, true

# This is the jquery from railscasts for endless scroll wasnt working with masonry so I'm using above instead
#jQuery ->
#  if $('.pagination').length
#    $(window).scroll ->
#      url = $('.pagination .next_page').attr('href')
#      if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 50
#           $('.pagination').text("Fuck more products...")
#           $.getScript(url)
#    $(window).scroll()


