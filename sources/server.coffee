statik = require('node-static')
file   = new(statik.Server)('./public')
redis  = require("redis")
auth = require("http-auth")
basic = auth({
  authRealm: "Metropolitain.io",
  authList : ['garconniere:wesh']
})

_connected = 0

httpServer = require('http').createServer( (request, response) ->

  basic.apply(request, response, (username) ->
    request.addListener('end', () -> file.serve(request, response) )
  )
 
).listen(8080);

nowjs    = require("now");
everyone = nowjs.initialize(httpServer);

nowjs.on('connect', (d) ->
	_connected += 1
	if everyone.now.connected
		everyone.now.connected(_connected)
)

nowjs.on('disconnect', (d) ->
	_connected -= 1
	if everyone.now.connected
		everyone.now.connected(_connected)
	everyone.now.disconnetedUser {user:@now.user}
)

everyone.now.validUserName = (data) ->

	_data = {user:data}

	@now.acceptUserName( _data )
	everyone.now.newUser( _data )

	return 

everyone.now.askConnected = () =>

	everyone.now.connected(_connected)

	return


everyone.now.postMessage = (data) =>

		everyone.now.receiveMessage(data)

	return

testClass = (content) =>

		if /[http]/.test(content)

		    if /[.jpg][.png][.gif]/.test(content)

		        _start = content.indexOf('http')
		        _end   = null

		        if content.indexOf('jpg') > 0

		            _end = content.indexOf('jpg')

		        else if content.indexOf('png') > 0

		            _end = content.indexOf('png')

		        else if content.indexOf('gif')

		            _end = content.indexOf('gif')

		        console.log _start, _end

		        @class += ' img'

		    else

		        @class += ' link'

	return 