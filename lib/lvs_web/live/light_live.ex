defmodule LvsWeb.LightLive do
  use LvsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:brightness, 10)}
  end

  def handle_event("on", _, socket) do
    {:noreply, socket |> assign(:brightness, 100)}
  end

  def handle_event("off", _, socket) do
    {:noreply, socket |> assign(:brightness, 0)}
  end

  def handle_event("down", _, socket) do
    # brightness = socket.assigns.brightness - 10
    # {:noreply, socket |> assign(:brightness, socket.assigns.brightness - 10)}
    # {:noreply, socket |> update(:brightness, fn b -> b - 10 end)}
    # {:noreply, socket |> update(:brightness, &(&1 - 10))}
    {:noreply, socket |> update(:brightness, &max(&1 - 10, 0))}
  end

  def handle_event("up", _, socket) do
    # brightness = socket.assigns.brightness + 10
    # {:noreply, socket |> assigns(:brightness, socket.assigns.brightness + 10)}
    # {:noreply, socket |> update(:brightness, fn b -> b + 10 end)}
    # {:noreply, socket |> update(:brightness, &(&1 + 10))}
    {:noreply, socket |> update(:brightness, &min(&1 + 10, 100))}
  end

  def render(assigns) do
    ~H"""
      <h1>Front Porch Light</h1>
      <div class="meter">
        <span style={"width: #{@brightness}%"}>
          <%= @brightness %>%
        </span>
      </div>
      <div>
        <button phx-click="off">Off</button> |
        <button phx-click="on">On</button> <hr/>
        <button phx-click="down">Down</button> |
        <button phx-click="up">Up</button>
      </div>
    """
  end
end
