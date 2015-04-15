# -*- encoding : utf-8 -*-
class CreateMathTests < ActiveRecord::Migration
  def change
    create_table :math_tests do |t|
      t.datetime :release_date
      t.text :B1_content
      t.decimal :B1_answer
      t.text :B2_content
      t.string :B2_image_url
      t.decimal :B2_answer
      t.text :B3_content
      t.string :B3_image_url
      t.decimal :B3_answer
      t.text :B4_content
      t.string :B4_image_url
      t.decimal :B4_answer
      t.text :B5_content
      t.decimal :B5_answer
      t.text :B6_content
      t.string :B6_image_url
      t.decimal :B6_answer
      t.text :B7_content
      t.decimal :B7_answer
      t.text :B8_content
      t.string :B8_image_url
      t.decimal :B8_answer
      t.text :B9_content
      t.string :B9_image_url
      t.decimal :B9_answer
      t.text :B10_content
      t.decimal :B10_answer
      t.text :B11_content
      t.string :B11_image_url
      t.decimal :B11_answer
      t.text :B12_content
      t.decimal :B12_answer
      t.text :B13_content
      t.decimal :B13_answer
      t.text :B14_content
      t.decimal :B14_answer

      t.timestamps
    end
  end
end
