class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :respondent_email
      t.string :response_id
      t.string :form_id
      t.string :form_name
      t.jsonb :fields
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
