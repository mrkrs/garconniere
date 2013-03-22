class Alert

    constructor: (@data) ->

        @class = @data.class || ""
        @id    = Math.round( Math.random() * new Date().getTime() )
        @user  = @data.user

        if @class is "connect"
            @content = "is now online"
        else
            @content = "is now offline"

        @generateHTML()

        return @

    generateHTML: () =>

        _string  = "<div class='alert #{@class}''>"
        _string += "<ul>"
        _string += "<li class='nav'>---------------</li>"
        _string += "<li class='user'> #{@data.user} </li>"
        _string += "<li class='content'> #{@content} </li>"
        _string += "<li class='nav'>---------------</li>"
        _string += "</ul>"
        _string += "</div>"

        @html = _string

        return @

    getClass: () =>

        return @class

window.Alert = Alert