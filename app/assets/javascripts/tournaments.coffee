$(document).on "turbolinks:load", ->

  startAtDatePicker = "form[data-tournament-form] [data-start-at]"
  endAtDatePicker = "form[data-tournament-form] [data-end-at]"

  $(startAtDatePicker).datetimepicker(
    format: "MMMM D YYYY, h:mm a"
    showClose: true
    minDate: new Date()
  )

  $(endAtDatePicker).datetimepicker(
    useCurrent: false
    format: "MMMM D YYYY, h:mm a"
    showClose: true
    minDate: new Date()
  )

  $(startAtDatePicker).on("dp.change", (e) ->
    $(endAtDatePicker).data("DateTimePicker").minDate(e.date))

  $(endAtDatePicker).on("dp.change", (e) ->
    $(startAtDatePicker).data("DateTimePicker").maxDate(e.date))
