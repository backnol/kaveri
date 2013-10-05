class AddEmbedHtmlToCard < ActiveRecord::Migration
  def change
    remove_column :cards, :link
    remove_column :cards, :image_url
    add_column    :cards, :embed_html, :text
  end
end
