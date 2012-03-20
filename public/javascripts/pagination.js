jQuery(function($) {
  if ($('.pagination .page').length) {
    $(window).scroll(function() {
      var url;
      url = $('.pagination .next_page a').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
        $('.pagination').text("Загрузка товаров...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});