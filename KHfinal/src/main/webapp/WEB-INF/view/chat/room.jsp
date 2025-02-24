<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Page</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
    <div class="container">
        <div class="col-6">
            <h1>${room.name}</h1>
        </div>
        <div>
            <div id="msgArea" class="col"></div>
            <div class="col-6">
                <div class="input-group mb-3">
                <form action="/jjapkorea/chat" method="post">
                	<input type="text" id="msg" class="form-control">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                    </div>
                </form>
                </div>
            </div>
        </div>
        <div class="col-6"></div>
    </div>

    <script>
        $(document).ready(function(){

            var roomName = "${room.name}";
            var roomId = "${room.roomId}";
            var username = "${room.name}";

            console.log(roomName + ", " + roomId + ", " + username);

            var sockJs = new SockJS("/jjapkorea/stomp/chat");
            var stomp = Stomp.over(sockJs);

            stomp.connect({}, function (){
                console.log("STOMP Connection");

                stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                    var content = JSON.parse(chat.body);

                    var writer = content.writer;
                    var message = content.message;
                    var str = '';

                    if(writer === username){
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-secondary'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }
                    else{
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-warning'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }
                });

                $("#button-send").on("click", function(e){
                    var msg = document.getElementById("msg");

                    console.log(username + ":" + msg.value);
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
                    msg.value = '';
                });

                stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}));
            });
        });
    </script>
</body>
</html>
