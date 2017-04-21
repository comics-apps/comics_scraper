ROM::SQL.migration do
  change do
    alter_table(:jobs) do
      add_index :type
    end

    alter_table(:gcd_covers) do
      add_index :issue_id
    end
  end
end
