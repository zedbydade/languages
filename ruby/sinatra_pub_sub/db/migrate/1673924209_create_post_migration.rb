Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id
      Text :text, null: false
      String :title, null: false
      String :created_at, null: false
    end
  end
end
