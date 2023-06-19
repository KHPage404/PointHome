<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

    <meta charset="UTF-8" />

    <title>Chat Application</title>
   
    <style>
    * {
		margin: 0px;
		padding: 0px;
	}    
    .chat_wrap .header {
		font-size: 14px;
		padding: 15px 0px;
		background: #9575DE;
		color: white;
		text-align: center;
	}
    .chat_wrap .input-div {
		position: fixed;
		bottom: 0px;
		width: 99%;
		text-align: center;
		justify-content: center;
		margin: 0 auto;	
		
	}
	#txtMessage {
		width: 99%;
		height: 30px;
		border: none;
		padding: 30px;
		bottom: 0px;
		resize: none;
		border-radius: 10px;
		background-color: #d2dae2;
	}

    /* 메시지 */
    .chat-message {
      padding: 10px;
      
      margin-bottom: 10px;
      border-radius: 5px;
    }

    .left {
      text-align: left;
    }

    .right {
      text-align: right;
    }
    /* 채팅작성자 */
    .chat_wrap #chat .sender {
		margin: 10px 25px 0px 10px;
		font-weight: bold;
	}
	  /* 좌측 메시지 스타일 */
    .left .message {
		display: inline-block;
		margin: 5px 20px 0px 10px;
		max-width: 75%;
		border: 1px solid;
		padding: 5px;
		border-radius: 10px 10px 10px 0px;
		color: white;
		background-color: #485460;
		text-align: left;      
    }
   	/* 우측 메시지 스타일 */
    .right .message {
		display: inline-block;
		margin: 5px 20px 0px 10px;
		max-width: 80%;
		border: 1px solid;
		padding: 5px;
		border-radius: 10px 10px 0px 10px;
		color: white;
		background-color: #E966A0;
		text-align: right;      
	    font-weight: bold;
    }
  </style>
  
    
  </head>
  <body>
    <div class="chat_wrap">
      <div class="header">
        <h3>채팅</h3>
      </div>
      <div id="chat"></div>
      <script id="temp" type="text/x-handlebars-template">
        <div class="{{printLeftRight sender}}">
          <div class="sender">{{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{date}}</div>
        </div>
      </script>
      <div class="input-div">
        <textarea
          id="txtMessage"
          cols="30"
          rows="10"
          placeholder="메시지를 입력한 후에 엔터키를 누르세요."
        ></textarea>
      </div>
    </div>
  </body>
  
  <!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
  <script>
    var uid = "${chatNick}";
    Handlebars.registerHelper("printLeftRight", function (sender) {
      if (uid != sender) {
        return "left";
      } else {
        return "right";
      }
    });
  </script>

  <script>
    var uid = "${chatNick}";
    $("#txtMessage").on("keydown", function (e) {
      if (e.keyCode == 13 && !e.shiftKey) {
        e.preventDefault();
        var message = $("#txtMessage").val();
        if (message == "") {
          alert("내용을 입력하세요!");
          return;
        }
        sock.send(uid + "|" + message);
        $("#txtMessage").val("");
      }
    });
    // 웹소캣 생성
	var roomId = ${roomNumber}

    var sock = new WebSocket("ws://localhost:8888/websocket/"+roomId);


    sock.onmessage = onMessage;

    // 서버로부터 메시지 받기
    function onMessage(msg) {
      var items = msg.data.split("|");
      var sender = items[0];
      var message = items[1];
      var date = items[2];
      var data = {
  		message: message,
        sender: sender,
        date: date,
      };
      var temp = Handlebars.compile($("#temp").html());
      $("#chat").append(temp(data));
      window.scrollTo(0, $("#chat").prop("scrollHeight"));
    }
  </script>

  
  
</html>
