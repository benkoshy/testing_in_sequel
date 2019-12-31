Sequel.migration do
  change do
    create_table(:organisations) do
      primary_key :id
      column :name, "text"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20191230053840_create_organisations.rb')"
  end
end
