defmodule ElixirSearchExtractor.SearchKeyword.Schemas.Keyword do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keywords" do
    field :html, :string
    field :result_count, :integer, null: false, default: 0
    field :result_urls, {:array, :string}, null: false, default: []
    field :status, Ecto.Enum, default: :processing, values: [processing: 0, completed: 1]
    field :title, :string, null: false
    field :top_ads_count, :integer, null: false, default: 0
    field :top_ads_urls, {:array, :string}, null: false, default: []
    field :total_ads_count, :integer, null: false, default: 0
    field :total_links_count, :integer, null: false, default: 0

    belongs_to :keyword_file, ElixirSearchExtractor.FileUpload.Schemas.KeywordFile

    timestamps()
  end

  @doc false
  def changeset(keyword, attrs) do
    keyword
    |> cast(attrs, [
      :title,
      :top_ads_count,
      :top_ads_urls,
      :total_ads_count,
      :result_count,
      :result_urls,
      :total_links_count,
      :html,
      :status,
      :keyword_file_id
    ])
    |> validate_required([
      :title,
      :keyword_file_id
    ])
  end

  def complete_changeset(keyword) do
    change(keyword, %{status: :completed})
  end
end
