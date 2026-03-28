# TodoServer

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## What it is

It's a simple toy server that works with requrests:

```json
{
  "items": ["item 1", "item 2", ...],
  "target": "item"
}
```

Via `POST` &amp; `DELETE` request via `/api/todo` route. 

## TODO

 - ~~[*] **Or** Remove `html` file~~;
 - [_] **Or** add `html` frontend. 

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
