$ ->
  $(document).on 'change', '#local_pais', (evt) ->
    $.ajax '/geografia/' + $("#local_pais option:selected").val(),
      type: 'GET'
      dataType: 'script'


  $(document).on 'change', '#local_estadoprovincia', (evt) ->
    $.ajax '/geografia/'+ $("#local_pais option:selected").val() + '/' + $("#local_estadoprovincia option:selected").val() ,
      type: 'GET'
      dataType: 'script'
      
