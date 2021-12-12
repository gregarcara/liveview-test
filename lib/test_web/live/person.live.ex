defmodule TestWeb.Live.PersonLive do
  use TestWeb, :live_view

  alias Test.Person

  def mount(_params, session, socket) do
    changeset = Person.change_person(%Person{})
    socket = assign(socket, :changeset, changeset)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.form let={f} for={@changeset}, url="#" class="mb-0 mt-8" phx-submit="save">
      <%= label f, :name %>
      <%= text_input f, :name %>
      <%= error_tag f, :name %>

      <%= label f, :address %>
      <%= text_input f, :address %>
      <%= error_tag f, :address %>

      <%= submit "Create Person", phx_disable_with: "Saving..." %>

    </.form>
    """
  end

  def handle_event("save", %{"person" => params}, socket) do
    changeset = Person.change_person(%Person{})
    socket = assign(socket, :changeset, changeset)
    {:noreply, socket}
  end
end
