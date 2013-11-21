class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
        t.string   :title
        t.string   :author
        t.datetime :published_date
        t.datetime :date
        t.text     :summary
    end
  end
end
