Crafty.c 'TweenRepeat',
  init: ->
    @requires('Tween')

  tweenRepeat: (attributes, delay = 200)->
    @_to = attributes
    @_from = _.clone(attributes)
    _.each(attributes, (val, key) => @_from[key] = @attr(key))
    @_current = 'to'
    @_delay = delay
    @bind('TweenEnd', => @tweenTo())
    @tweenTo()

  tweenTo: ->
    at = if @_current == 'to' then @_to else @_from
    @tween(at, @_delay)
    if @_current == 'to' then @_current = 'from' else @_current = 'to'
    @


Crafty.c 'ForegroundElements',
  init: ->
    @shadow = Crafty.e('2D, DOM, Image, TweenRepeat').image(Game.images.shadow).attr(x: 140, y: 180)
    @hand1  = Crafty.e('2D, DOM, Image').image(Game.images.hand1).attr(x: -100, y: 250)
    @hand2  = Crafty.e('2D, DOM, Image').image(Game.images.hand2).attr(x: 360, y: 440)
    @hand3  = Crafty.e('2D, DOM, Image').image(Game.images.hand3).attr(x: 854, y: 333)

    @shadow.alpha = 0.5

    @shadow.tweenRepeat(
      y: 200
    )

    @