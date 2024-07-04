import consumer from "./consumer"

consumer.subscriptions.create("CryptoChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the CryptoChannel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the CryptoChannel")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data:", data)
    const btcPriceElement = document.getElementById('btc-price')
    if (btcPriceElement) {
      btcPriceElement.innerText = `Priceee: ${data.price}`
    }
  }
});
