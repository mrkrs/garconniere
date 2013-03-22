class ChatController

	constructor: (@data) ->

		@me  	  = 'Nicolas'
		@messages = []
		@users    = []
		@chat     = $('#chat')

		$('#input input').on('keypress', (e) =>
			
				if e.charCode is 13

					_content = $('#input input').val()
					@onPost({user:@me, content:_content})
					$('#input input').val("")

		)

		$('#send').on('click', (d) =>

			_content = $('#input input').val()
			@onPost({user:@me, content:_content})
			$('#input input').val("")

		)

		return @

	onAlert: (data) =>

		_alert = new Alert(data)

		console.log _alert

		@chat.append(_alert.html)

	onReception: (data) =>

		_message = new Message(data)		
		@messages.push _message

		@chat.append(_message.html)

		@setStory(_message)

		@scrollChat()

		return 

	onPost: (data) =>

		now.postMessage(data)

		return @

	setStory: (_message) =>

		_result      = false
		_lastMessage = @messages[ @messages.length-2 ]

		if _lastMessage?

			if _lastMessage.user is _message.user

				if _lastMessage.getClass() is ''
					_lastMessage.setClass('start')
				else
					_lastMessage.setClass('continue')

				_message.setClass('end')

			else

				if _lastMessage.getClass is 'continue'
					_lastMessage.setClass('end')

		return _result

	scrollChat: () =>

		elem = document.getElementById('chat');
		elem.scrollTop = elem.scrollHeight;

		return 

window.ChatController = ChatController