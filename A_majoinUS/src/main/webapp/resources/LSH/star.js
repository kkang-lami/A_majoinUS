   $('.starRev span').click(function() {
      $(this).parent().children('span').removeClass('on');
      $(this).addClass('on').prevAll('span').addClass('on');
      var eval = $(this).attr("id");
      var text = document.getElementById('eval');
      text.value=eval;
      return false;
   });