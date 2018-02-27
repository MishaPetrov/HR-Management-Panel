class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:employees) do |e|
      e.column(:name, :string)
      e.column(:name, :string)
      e.column(:division_id, :integer)
      e.timestamps()
    end
    create_table(:divisions) do |d|
      d.column(:name, :string)
      d.timestamps()
    end
  end
end
