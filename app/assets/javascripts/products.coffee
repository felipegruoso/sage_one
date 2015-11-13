# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  add_field = (value) ->
    div = document.createElement('div')
    div.className = "input-group input-margin"

    input = document.createElement('input')
    input.className = "form-control modal-input"
    input.setAttribute('placeholder', $('#placeholder').val())
    if value
      input.value = value

    span = document.createElement('span')
    span.className = "input-group-btn remove-input"

    button = document.createElement('button')
    button.className = "btn btn-danger"

    icon = document.createElement('span')
    icon.className = "glyphicon glyphicon-minus"

    button.appendChild(icon)
    span.appendChild(button)
    div.appendChild(input)
    div.appendChild(span)

    document.getElementById('inputs').appendChild(div)

  populate_modal = () ->
    values = JSON.parse($('#values').val())

    for value in values
      add_field(value)

  $('.open-modal-categories').click ->
    $('#title').val("Categories")
    $('#placeholder').val("Description")
    $('#values').val($('#product_categories').val())
    $('#field').val("#product_categories")
    $('#fake').val('#product_fake_categories')

  $('.open-modal-selling-values').click ->
    $('#title').val("Selling Values")
    $('#placeholder').val("Value")
    $('#values').val($('#product_selling_values').val())
    $('#field').val("#product_selling_values")
    $('#fake').val('#product_fake_selling_values')

  $('#modal').on 'shown.bs.modal', ->
    $('#myModalLabel').html($('#title').val())
    $('#inputs').html('')
    populate_modal()

  $('#add-field').click ->
    add_field()

  $('#modal-confirm').click (e) ->
    field = $('#field').val()
    fake = $('#fake').val()
    inputs = document.getElementsByClassName('modal-input')

    new_values = []
    for input in inputs
      new_values.push(input.value)

    new_values = new_values.filter (n) ->
      n != null && n != undefined && String(n).trim() != ''
    new_fake = new_values.join("; ");

    if new_fake == ''
      new_fake = 'None'

    $(fake).val(new_fake)
    $(field).val(JSON.stringify(new_values))
    $('#modal').modal('hide')

  $(document).on 'click', '.remove-input', ->
    $(this).closest('div').remove()

  $(".import-form").on("ajax:complete", (xhr, status) ->
    resp = JSON.parse(status.responseText)
    message = resp["message"]

    if message == 'Success'
      klass = 'success'
    else
      klass = 'danger'

    div = document.createElement('div')
    div.className = "alert alert-" + klass + " alert-dismissible margin-alert"
    div.setAttribute('role', 'alert')

    button = document.createElement('button')
    button.className = "close"
    button.setAttribute('data-dismiss', 'alert')
    button.setAttribute('aria-label', 'Close')

    span = document.createElement('span')
    span.setAttribute('aria-hidden', true)
    span.innerHTML = "&times;"

    button.appendChild(span)
    div.appendChild(button)
    div.insertAdjacentHTML('beforeend', message)

    message_div = document.getElementById('message')
    message_div.innerHTML = ''
    message_div.appendChild(div)
  )
