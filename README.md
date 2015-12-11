# Ex Pusher Lite - Client Side Demo

To start your Rails app:

  1. Install dependencies with `bundle`
  2. Start Phoenix endpoint with `rails s`
  4. Go to `http://localhost:3000`

You will find a very simple Websocket-based client demo that will connect to the Server-Side component at `localhost:4000`.

You have to have both running. In the server side there is a 'test-app' sample application with a sample key and secret. This must be configured in your `.env` file like this:

    PUSHER_URL: "localhost:4000"
    PUSHER_APP_ID: "test-app"
    PUSHER_KEY: "test-app-fake-key"
    PUSHER_SECRET: "test-app-fake-secret"
    PUSHER_CHANNEL: "public:prod_chat_channel"

Which is the same as in the server-side seed.

## Learn more

  * Follow : http://www.akitaonrails.com/expusherlite
  * Sample Client Demo : https://github.com/akitaonrails/pusher_lite_demo