module Searchable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def search_by_title(search)
      where('title LIKE ?', "%#{search}%")
    end

    def search_by_category(search)
      where('category LIKE ?', "%#{search}%")
    end
    
  end
end  