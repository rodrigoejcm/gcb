$("#evento_cidade").empty()
  .append("<%= escape_javascript(render(:partial => "cidades")) %>")