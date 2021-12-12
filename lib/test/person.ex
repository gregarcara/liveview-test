defmodule Test.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "person" do
    field :name, :string
    field :address, :string
  end

  def changeset(person, attrs) do
    person
    |> cast(attrs, [
      :name,
      :address,
    ])
    |> validate_name()
  end

  defp validate_name(changeset) do
    changeset
    |> validate_required([:name])
  end

  def change_person(%Person{} = person, attrs \\ %{}) do
    person
    |> Person.changeset(attrs)
  end

end

