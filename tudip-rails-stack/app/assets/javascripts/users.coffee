usersReady = ->
  if $('#sign-in-modal').length
    $('#sign-in-modal').modal()
  if $('#sign-up-modal').length
    $('#sign-up-modal').modal()
  if $('#forgot-password-modal').length
    $('#forgot-password-modal').modal()
  if $('#confirmation-new-modal').length
    $('#confirmation-new-modal').modal()
  if('#change-password-modal').length
    $('##change-password-modal').modal()

$(document).ready(usersReady)