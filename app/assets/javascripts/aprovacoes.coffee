# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
 	$('.tabela_aprovacao').dataTable
 		"lengthChange": false,
 		"pageLength": 10,
 		"language": { "url": "https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"}

