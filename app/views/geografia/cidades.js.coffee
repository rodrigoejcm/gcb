$("#evento_cidade").empty()
  .append("<%= escape_javascript(render(:partial => "cidades")) %>")

$("#local_cidade").empty()
  .append("<%= escape_javascript(render(:partial => "cidades")) %>")



