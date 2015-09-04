$(document).ready ->
  $.fn.animateRotate = (deg, angle, duration, easing, complete) ->
    args = $.speed(duration, easing, complete)
    step = args.step
    @each (i, e) ->

      args.step = (now) ->
        $.style e, 'transform', 'rotate(' + now + 'deg)'
        step.apply(this, arguments) if step

      $(deg: deg).animate { deg: angle }, args
