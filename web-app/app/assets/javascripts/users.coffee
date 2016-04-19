
usersReady = ->
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

  $('#admin_new_user_set_pwd').validate
    rules: {
      'admin[pwd]': {
        required: true,
        minlength: 8
      },
      'admin[password_confiramtion]': {
        required: true,
        equalTo: '#admin_pwd'
      },
    },
    messages: {
      'admin[pwd]': {
        minlength: 'Please enter minimum of 8 characters.'
      },
      'admin[password_confirmation]': {
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

  $('#forgot_pwd').validate
    rules: {
      'user[email]': {
        required: true,
        custom_email: true
      },
    },
    messages: {
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

  $('#reset_pwd').validate
    rules: {
      'user[password]': {
        required: true,
        minlength: 8
      },
      'user[password_confiramtion]': {
        required: true,
        equalTo: '#user_password'
      },
    },
    messages: {
      'user[password]': {
        minlength: 'Please enter minimum of 8 characters.'
      },
      'user[password_confiramtion]': {
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

  $('#sign_up').validate
    rules: {
      'user[email]': {
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
      'user[check-box]': {
        required: true
      },
      'user[password]': {
        minlength: 8,
        required: true
      },
      'user[retypepassword]': {
        required: true,
        equalTo: '#user_password'
      },
    },
    messages: {
      'user[check-box]': {
        required: 'Please accept the agreement before signup.'
      },
      'user[first_name]': {
        maxlength: 'First name should not exceed more than 20 letters.',
        letters_only: 'Please enter only letters for first name.'
      },
      'user[last_name]': {
        maxlength: 'Last name should not exceed more than 20 letters.',
        letters_only: 'Please enter only letters for last name.'
      },
      'user[email]': {
        custom_email: 'Please enter valid email.'
      },
      'user[password]': {
        minlength: 'Please enter minimum of 8 characters.'
      },
      'user[retypepassword]': {
        equalTo: 'Password and Confirm password should be same.'
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

  $('#sign_in').validate
    rules: {
      'user[email]': {
        required: true,
        custom_email: true
      },
      'user[password]': {
        required: true,
        minlength: 8
      },
      'user[retypepassword]': {
        required: true,
        equalTo: '#user_password'
      },
    },
    messages: {
      'user[email]': {
        custom_email: 'Please enter valid email.'
      },
      'user[password]': {
        minlength: 'Please enter minimum of 8 characters.'
      },
      'user[retypepassword]': {
        equalTo: 'Please enter confirm password.'
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


  $('#edit_user').validate
    rules:{
      'user[first_name]': {
        required: true,
        letters_only: true,
        maxlength: 20
      },
      'user[last_name]': {
        required: true,
        letters_only: true,
        maxlength: 20
      },
      'user[profile_attributes][dob]': {
        required: true
      },
      'user[profile_attributes][phonenumber]': {
        required: true
      },
      'user[profile_attributes][budget]': {
        required: true,
        NumbersOnly: true,
        maxlength: 7
      },
      'user[profile_attributes][agechild]': {
        required: true,
        maxlength: 2,
        NumbersOnly: true
      },
    },
    messages: {
      'user[first_name]': {
        required: 'Please enter First Name.',
        maxlength: 'First name should not exceed more than 20 letters.'
      },
      'user[last_name]': {
        required: 'Please enter Last Name.',
        maxlength: 'Last name should not exceed more than 20 letters.'
      },
      'user[profile_attributes][dob]': {
        required: 'Please enter Date of Birth.'
      },
      'user[profile_attributes][budget]': {
        required: 'Please Enter your Budget.',
        maxlength: 'Budget should not exceed more than 7 letters.'
      },
      'user[profile_attributes][phonenumber]': {
        required: 'Please enter a valid Phone Number.'
      },
      'user[profile_attributes][agechild]': {
        required: 'Please mention age of child.',
        maxlength: 'Age should not exceed more than 2 letters.'
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


  $('.date-field').datepicker

  $('.phone-number').mask("999-999-9999");

  $('#datepicker-futuredisabled').datepicker
    format: 'mm/dd/yyyy'
    endDate: 'today'


  $(window).bind 'pageshow', ->
  form = $('form')
  # let the browser natively reset defaults
  form[0].reset()
  return

$(document).ready(usersReady)