$(document).ready ->
  $.fn.extend backstrechSlider: (options) ->
    @options =
      bulletsSelector: '#bullets'
      descriptionSelector: '#description'
      data: [ {
        image: ''
        description: ''
      } ]
      fade: 2000
      onImageClick: (index, data) ->
      onImageChange: (index, data) ->
        `var options`
    @options = $.extend({}, @options, options or {})
    options = @options
    $image = $(this)
    $bullets = $(@options.bulletsSelector)
    $description = $(@options.imageSelector)
    images = _.map(@options.data, (i) ->
      i.image
    )
    $image.backstretch images,
      duration: 6000
      fade: @options.fade
    $bullets.empty()
    $.each images, (i, e) ->
      $bullets.append $('<div class="bullet" index="' + i + '">').click(->
        $image.backstretch 'show', parseInt($(this).attr('index'))
      )
    $(document).keyup (eventObject) ->
      if eventObject.keyCode == 37
        #left
        $image.backstretch 'prev'
      else if eventObject.keyCode == 39
        #right
        $image.backstretch 'next'
    $image.click ->
      i = $image.data('backstretch').index
      options.onImageClick i, options.data[i]

    refresh = (index) ->
      $bullet = $('.bullet')
      $bullet.removeClass 'active'
      $($bullet[index]).addClass 'active'
      $(options.descriptionSelector).html options.data[index].description
      options.onImageChange index, options.data[index]

    $(window).on 'backstretch.before', (e, instance, index) ->
      refresh index
    refresh 0
