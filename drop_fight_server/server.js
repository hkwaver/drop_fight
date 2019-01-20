var Define = Define || {};
Define.Packet = Define.Packet || {};
Define.Packet.PK_AUTH_HELLO = 100;
Define.Packet.PK_ROOM_MAKE  = 1000;
Define.Packet.PK_ROOM_JOIN  = 1001;
Define.Packet.PK_DEPARTURE  = 2000;


var server = require('ws').Server;
var s = new server({ port: 8080});

var players = [];

s.on('connection', function(ws) {

    ws.on('message', function(message) {
        console.log('message: ' + message);

        var data = JSON.parse(message);

        if (data.type == Define.Packet.PK_ROOM_MAKE) {
            console.log('PK_ROOM_MAKE: ' + data);
            players.push(data.data.player_id);
            data.data.players = players;
        }

        s.clients.forEach(function(client) {

            var jsonStr = JSON.stringify(data);
            console.log('send: ' + jsonStr);
            client.send(jsonStr);
        });
    });

    ws.on('close', function(){
        console.log('I lost a client');
    });
});
