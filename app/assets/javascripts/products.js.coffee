#monitors page height and goes to next pagination url (href) if bottom is reached. 
#note that page, includes an offset of 50 pixels for footer
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more products...")
        $.getScript(url)

#autocomplete implemenation
	$("#product_category_name").autocomplete
	source: $('#product_category_name').data('autocomplete-source')



