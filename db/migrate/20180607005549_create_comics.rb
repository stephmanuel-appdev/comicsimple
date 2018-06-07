class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name
      t.string :comic_url

      t.timestamps

    end
  end
end
