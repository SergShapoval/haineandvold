var $button = $('.buttonLogout');
$button.hover(function() {
  sin = setInterval($dotsShow, 800);
  return sin;

  function $dotsShow() {
    var $bp = $button.position(),
      $bt = $bp.top,
      $bl = $bp.left,
      $nl = $bl + Math.random() * 30,
      $nl2 = $bl - Math.random() * 30,
      $nt = $bt - 20 + Math.random() * 50,
      $n2l = Math.random() * 300,
      $n2t = Math.random() * 100,
      $n3l = Math.random() * 300,
      $n3t = Math.random() * 100;
    $('div.page').append('<div class="dots"></div>', '<div class="dots2"></div>');
    $('div.dots').css({
      'top': $nt,
      'left': $nl
    }).animate({
      top: '-=' + $n2t,
      left: '+=' + $n2l,
      opacity: '0'
    }, 3000).queue(function() {
      $(this).remove();
    })
    $('div.dots2').css({
      'top': $nt,
      'left': $nl2
    }).animate({
      top: '-=' + $n3t,
      left: '-=' + $n3l,
      opacity: '0'
    }, 3000).queue(function() {
      $(this).remove();
    })
  }
}, function() {
  clearInterval(sin);
});