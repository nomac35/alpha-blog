class Category < ActiveRecord::Base
    has_many :article_categories
    has_many :articles, through: :article_categories
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 25 }
    
end