class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :person_type
      t.string :name
      t.string :document_number
      t.string :verifying_digit
      t.string :document_type

      t.timestamps
    end
  end
end
