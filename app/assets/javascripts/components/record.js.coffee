  @Record = React.createClass
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { record: @state }, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , 'JSON'
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
      React.DOM.tr null,
        React.DOM.td null, @props.record.id
        React.DOM.td null, @props.record.title
        React.DOM.td null, @props.record.text