defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Story Teller v0.1!")
    render conn, "index.html"
  end

  get "/story1" do
    conn = conn.assign(:title, "Story1")
    conn = conn.send_chunked(200)
    conn.chunk("Animal")
    conn.chunk("Bellota")
    conn.chunk("Calasparra")
    conn.chunk("Dadivoso")
    conn.chunk("Emergencia")
    conn.chunk("Faisan")
    conn.chunk("Galicia")
    conn.chunk("Hipopotamo")
  end
end
