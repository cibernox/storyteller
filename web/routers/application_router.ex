defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn = conn.assign :layout, "layout"
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Concurrent Story Teller v0.1!")
    render conn, "index.html"
  end

  get "/:story_name" do
    normalized_title = String.capitalize(String.replace(conn.params[:story_name], "-", " "))
    conn = conn.assign :title, normalized_title
    render conn, "#{conn.params[:story_name]}.html"
  end

  get "/play/:story_name" do
    conn = conn.resp_content_type("text/event-stream")
    conn = conn.send_chunked(200)

    iterator = File.iterator!("#{conn.params[:story_name]}.txt")

    Enum.each iterator, fn(line) ->
      { :ok, conn } = conn.chunk "data: #{line}\n"
      await conn, 1000, on_wake_up(&1, &2), on_time_out(&1)
    end
    conn
  end

  defp on_wake_up(arg1, arg2) do
    # Nothing
  end

  defp on_time_out(arg1) do
    # Nothing
  end
end
