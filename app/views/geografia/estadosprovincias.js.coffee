$("#evento_estadoprovincia").empty()
  .append("<%= escape_javascript(render(:partial => "estados")) %>")