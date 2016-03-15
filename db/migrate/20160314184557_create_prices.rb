class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :section_id
      t.float :value
      t.string :name
      t.time :duration
      t.string :unit_name

      t.timestamps null: false
    end
    Section.all.each do |section|
      section.prices << Price.new(value: section.setting.base_price, duration: section.setting.session_duration, unit_name: 'Sesión')
    end

    User.order(created_at: :asc).limit(2).update_all(rank: 6)
  end
end
