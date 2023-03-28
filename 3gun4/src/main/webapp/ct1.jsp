<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<html>
<head>
    <meta charset="utf-8">
    <title>실시간 단체 채팅방</title>
    <style>
body {
	font-family: sans-serif;
	margin: 0;
	padding: 0;
}


input[type="text"] {
	width: 100%;
	border: 1px solid #ccc;
	padding: 10px;
	font-size: 16px;
}




.sent {
  background-color: #007bff;
  color: #fff;
  border-radius: 10px;
  padding: 10px;
  margin-bottom: 5px;
  float: right;
}

.received {
  background-color: #f1f0f0;
  color: #333;
  border-radius: 10px;
  padding: 10px;
  margin-bottom: 5px;
  float: left;
}

/* 시간 */
.time {
  font-size: 12px;
  color: #999;
  margin-left: 10px;
}

#chat {
  height: 400px;
  width: 300px;
  margin: auto;
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 10px;
  overflow-y: scroll;
}

#input {
  width: 70%;
  padding: 10px;
  border: none;
  border-radius: 10px;
  outline: none;
}

button {
  width: 28%;
  padding: 10px;
  border: none;
  border-radius: 10px;
  background-color: #007bff;
  color: #fff;
  outline: none;
  cursor: pointer;
}

button:hover {
  background-color: #0069d9;
}

::-webkit-scrollbar {
  width: 5px;
}

::-webkit-scrollbar-thumb {
  background-color: #ccc;
  border-radius: 5px;
}

::-webkit-scrollbar-track {
  background-color: #f1f1f1;
}

</style>
  </head>
  <body>
  <div id="chat">
  <ul id="messages"></ul>
  <form action="">
    <input id="input" autocomplete="off" /><button>전송</button>
  </form>
</div>


	<script>

const socket = new WebSocket("ws://localhost:8000");

const form = document.querySelector("form");
const input = document.querySelector("#input");
const messages = document.querySelector("#messages");

form.addEventListener("submit", function (event) {
  event.preventDefault();
  const message = input.value;
  socket.send(message);
  input.value = "";
});

socket.addEventListener("message", function (event) {
  const li = document.createElement("li");
  const message = event.data;
  const time = new Date().toLocaleTimeString();

  li.textContent = message;
  li.classList.add("received");

  const timeElement = document.createElement("span");
  timeElement.textContent = time;
  timeElement.classList.add("time");

  li.appendChild(timeElement);
  messages.appendChild(li);
});
</script>
<script>
const WebSocket = require("ws");

const wss = new WebSocket.Server({ port: 8000 });

wss.on("connection", function connection(ws) {
  ws.on("message", function incoming(data) {
    wss.clients.forEach(function each(client) {
      if (client.readyState === WebSocket.OPEN) {
        client.send(data);
      }
    });
  });
});
</script>
</body>

</html>