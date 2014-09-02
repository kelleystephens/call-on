class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamp :called_on

      t.timestamps
    end
  end
end
