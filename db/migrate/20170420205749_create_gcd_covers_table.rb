ROM::SQL.migration do
  change do
    create_table :gcd_covers do
      column :issue_id, :integer, null: false
      column :url, String, null: false
      column :position, :integer, null: false
    end
  end
end
