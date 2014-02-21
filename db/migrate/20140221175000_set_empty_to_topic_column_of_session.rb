class SetEmptyToTopicColumnOfSession < ActiveRecord::Migration
  def change
    Session.update_all(topic: '')
  end
end