statik = require('node-static')
file   = new(statik.Server)('./public')
redis  = require("redis")
auth = require("http-auth")
basic = auth({
  authRealm: "Metropolitain.io",
  authList : ['dataveyes:datadatadata']
})

httpServer = require('http').createServer( (request, response) ->

  basic.apply(request, response, (username) ->
    request.addListener('end', () -> file.serve(request, response) )
  )
 
).listen(8080);

nowjs    = require("now");
everyone = nowjs.initialize(httpServer);

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