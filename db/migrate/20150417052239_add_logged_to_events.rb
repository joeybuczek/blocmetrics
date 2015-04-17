class AddLoggedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :logged, :integer
    add_column :events, :logged_str, :string
  end
end
