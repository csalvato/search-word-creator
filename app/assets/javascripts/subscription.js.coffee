# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()

subscription =
  setupForm: ->
    $('#purchase-form').submit (event) ->
      event.preventDefault()
      $('input[type=submit]').attr('disabled', true)
      subscription.processCard()
      mixpanel.track("Clicked purchase button")
      false
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, subscription.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_card_token').val(response.id)
      $('#purchase-form')[0].submit()
      mixpanel.track("Successfully Paid")
    else
      $("#stripe-error").addClass('alert alert-error')
      $("#stripe-error").text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
      mixpanel.track("Seeing Payment Error")