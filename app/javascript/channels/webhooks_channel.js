import consumer from "channels/consumer";

consumer.subscriptions.create("WebhooksChannel", {
  received(data) {
    location.reload();
  },
});
