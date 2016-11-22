$ ->
  $(document).on 'change', '#evento_pais', (evt) ->
    $.ajax '/geografia/' + $("#evento_pais option:selected").val(),
      type: 'GET'
      dataType: 'script'


  $(document).on 'change', '#evento_estadoprovincia', (evt) ->
    $.ajax '/geografia/'+ $("#evento_pais option:selected").val() + '/' + $("#evento_estadoprovincia option:selected").val() ,
      type: 'GET'
      dataType: 'script'
      
