class Room < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reservations, dependent: :destroy

    # def Room.search(search)
    #     Room.where(['area LIKE ?', "%#{search}%"])
    # end

    # scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    #     return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない
    
    #     title(search_params[:title])
    #       .price(search_params[:price])
    #       .area(search_params[:area])
    #       .address(search_params[:address])   #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
    #   end
    
    #   scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }  #scopeを定義。
    #   scope :price_like, -> (price) { where('price LIKE ?', "%#{price}%") if price.present? }  #scopeを定義。
     
    #   scope :area_like, -> (area) { where('area LIKE ?', "%#{area}%") if area.present? }

    #   scope :address_like, -> (address) { where('address LIKE ?', "%#{address}%") if address.present? }
     #scope :メソッド名 -> (引数) { SQL文 }
     #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない

    # Room.where(['title LIKE ?', "%#{search}%"])
    #     Room.where(['price LIKE ?', "%#{search}%"])
    #     Room.where(['content LIKE ?', "%#{search}%"])
    #     Room.where(['address LIKE ?', "%#{search}%"])
end
