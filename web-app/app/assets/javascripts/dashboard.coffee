# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
dashReady = ->
  
  #Method for allowing only letters
  jQuery.validator.addMethod 'letters_only', ((value, element) ->
    @optional(element) or /^[a-z ,.'-]+$/i.test(value)
  ), 'Letters only'

  #Method for allowing Numbers Only
  jQuery.validator.addMethod 'NumbersOnly', ((value, element) ->
    @optional(element) or /^[0-9\-\+()\s]+$/i.test(value)
  ), 'Numbers Only'

  # This method will allow strict email format
  jQuery.validator.addMethod 'custom_email', ((value, element) ->
    return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value)
  ), 'Invalid email'

  $('#update_user_password').validate
    rules: {
      'user[current_password]': {
        required: true,
        minlength: 8
      },
      'user[password]':{
        required: true,
        minlength: 8
      }
      'user[password_confirmation]':{
        required: true,
        equalTo: '#user_password'
      },
    },
    messages: {
      'user[current_password]':{
        minlength: 'Please enter minimum of 8 characters.',
      },
      'user[password]':{
        minlength: 'Please enter minimum of 8 characters.',
      },
      'user[password_confirmation]':{
        equalTo: 'New password and Confirm password should be same.'
      },
    }
    errorPlacement: (error, element) ->
      error.insertBefore $(element).closest('.form-group')
      return
    highlight: (element) ->
      $(element).closest('.form-group').removeClass('has-success').addClass 'has-error'
    unhighlight: (element) ->
      $(element).closest('.form-group').removeClass('has-error').addClass 'has-success'
    errorElement: 'span'
    errorClass: 'help-block'

  $('#admin_new_user').validate
    rules: {
      'user[email]': {
        required: true,
        custom_email: true
      },
      'user[first_name]': {
        required: true,
        maxlength: 20,
        letters_only: true
      },
      'user[last_name]': {
        required: true,
        maxlength: 20,
        letters_only: true
      },
      'user[name]': {
        required: true
      },
    },
    messages: {
      'user[name]': {
        required: 'Please select one role for user.'
      },
      'user[first_name]': {
        maxlength: 'First name should not be exceed more than 20 letters.',
        letters_only: 'Please enter only letters for first name.'
      },
      'user[last_name]': {
        maxlength: 'Last name should not be exceed more than 20 letters.',
        letters_only: 'Please enter only letters for last name.'
      },
      'user[email]': {
        custom_email: 'Please enter valid email.'
      },
    }
    errorPlacement: (error, element) ->
      error.insertBefore $(element).closest('.form-group')
      return
    highlight: (element) ->
      $(element).closest('.form-group').removeClass('has-success').addClass 'has-error'
    unhighlight: (element) ->
      $(element).closest('.form-group').removeClass('has-error').addClass 'has-success'
    errorElement: 'span'
    errorClass: 'help-block'

  $('#change-password').click ->
    $('#change-password-modal').modal('show')
$(document).ready(dashReady)