import consumer from "./consumer"

consumer.subscriptions.create("RandomNumberChannel", {
  connected() {
    console.log("Connected to RandomNumberChannel");
  },

  disconnected() {
    console.log("Disconnected from RandomNumberChannel");
  },

  received(data) {
    document.getElementById("random-number").innerText = data.number;
  }
});
