ROM::SQL.migration do
  change do
    create_table :jobs do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4),
                         primary_key: true
      column :type, String
      column :priority, :integer
      column :settings, :jsonb
    end
  end
end
