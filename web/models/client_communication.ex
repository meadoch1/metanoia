defmodule Metanoia.ClientCommunication do
  use Metanoia.Web, :model

  schema "client_communications" do
    field :sent_dt, Ecto.Date
    field :note, :string
    belongs_to :client, Metanoia.Client
    belongs_to :client_communication_type, Metanoia.ClientCommunicationType

    timestamps
  end

  @required_fields ~w(sent_dt note)
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
end
