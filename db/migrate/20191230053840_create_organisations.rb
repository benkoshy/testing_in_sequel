Sequel.migration do
  change do

    create_table :organisations do
      primary_key :id
      String :name
    end

  end
end
