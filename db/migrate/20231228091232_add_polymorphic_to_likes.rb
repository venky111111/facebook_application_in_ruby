class AddPolymorphicToLikes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :likes, :post, foreign_key: true rescue ActiveRecord::StatementInvalid
    remove_reference :likes, :postcomment, foreign_key: true rescue ActiveRecord::StatementInvalid
    add_reference :likes, :likeable, polymorphic: true
  end
end
