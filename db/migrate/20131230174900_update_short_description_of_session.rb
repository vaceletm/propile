class UpdateShortDescriptionOfSession < ActiveRecord::Migration
  def change
    change_column :sessions, :short_description, :text
  end
end