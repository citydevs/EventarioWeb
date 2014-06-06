
  $('#book_search').typeahead({
      name: "book",
      remote: "/books/autocomplete?query=%QUERY"
  });



$(document).ready(function() {
  $('#e1').select2({
    ajax: {
      url: '/venues',
      dataType: 'json',
      data: function(term, pag) {
        return {
          query: term,
          page: pag
        }
      },
       results: function (data, page) {
        var myResults = [];
            $.each(data, function (index, item) {
                myResults.push({
                    id: item.id,
                    text: item.nombre
                });
            });
            return {
                results: myResults
            };
        }
    }
  });
});


