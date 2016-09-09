class AddEmailSentColumnToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :email_sent, :boolean, { default: false }
  end
end
