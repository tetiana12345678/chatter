// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

const init = (socket, document) => {
  let channel = socket.channel("room:lobby", {})
  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  let username = document.getElementById("username")
  let message = document.getElementById("message")
  let messages = document.getElementById("messages")

  message.addEventListener("keypress", keyPressHandler(username, message, channel))

  channel.on("new_message", renderMessage(messages))
}

const keyPressHandler = (username, message, channel) => {
  return (event) => {
    if (event.charCode == 13) {
      channel.push("new_message", {
        user: username.value,
        body: message.value
      })
      message.value = ""
    }
  }
}

const renderMessage = (messages) => ({user, body}) => {
  const new_message = `<p><b>[${user}]</b>:${body}</p>`
  messages.insertAdjacentHTML('beforeend', new_message)
}

init(socket, document)
