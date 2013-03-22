class Message

    constructor: (@data) ->

        @class = @data.class || ""
        @id    = Math.round( Math.random() * new Date().getTime() )
        @user  = @data.user

        @parseContent()
        @generateHTML()

        return @

    parseContent: () =>

        # if /[http]/.test(@data.content)

        #     if /[.jpg][.png][.gif]/.test(@data.content)

        #         @class += ' img'

        #     else

        #         @class += ' link'

        @data.parsedContent = @data.content

        return @

    generateHTML: () =>

        _string  = "<div id='#{@id}' class='message #{@class}'>"
        _string += "<ul>"
        _string += "<li class='user'> #{@data.user} </li>"
        _string += "<li class='content'> #{@data.parsedContent} </li>"
        _string += "</ul>"
        _string += "</div>"

        @html = _string

        return @

    setClass: (value) =>

        @class = value
        $('#'+@id).attr("class", "message #{@class}" )

    getClass: () =>

        return @class

window.Message = Message