ActiveRecord::Schema.define(:version => 0) do
  create_table :topics, :force => true do |t|
    t.string :title, :title_hr, :title_sl
    t.string :body, :body_hr, :body_sl
    t.integer :author_id
  end
end
