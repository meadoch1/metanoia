defmodule Metanoia.Person do
  use Metanoia.Web, :model

  schema "persons" do
    field :first_name, :string
    field :last_name, :string
    field :middle_name, :string
    field :phone, :string
    field :mobile_phone, :string
    field :email, :string
    field :dob, Ecto.Date
    field :work_phone, :string
    field :spouse_name, :string
    field :email2, :string
    field :nickname, :string
    field :suffix, :string
    belongs_to :address, Metanoia.Address
    belongs_to :church, Metanoia.Church
    belongs_to :pastor, Metanoia.Pastor

    timestamps
  end

  @required_fields ~w(first_name last_name middle_name phone mobile_phone email dob work_phone spouse_name email2 nickname suffix)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def order_by_name(query) do
    from p in query,
    order_by: [asc: p.last_name, asc: p.first_name]
  end

  def full_name(model) do
    "#{model.first_name} #{model.last_name}"
  end
end
