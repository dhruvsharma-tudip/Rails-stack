# This coffescript maintains the sidebar and header on which pages it has to be hide.
$(document).ready ->
  if $('body').find('.login-page, .reset-password, .confirmation-instructions, .change-password, .registration-new').length > 0
    $('#page-content').css('margin-left', '0');
    $('body').css('padding-top' ,'0');

  if $('body').find('#custom-datatable').length > 0
    $('#custom-datatable').dataTable ->
      responsive : true

  $('body').on 'click', '.schoolsparrow-logo', ->
    location.reload('/')