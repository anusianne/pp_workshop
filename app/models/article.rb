class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 30}
    validates :body, presence: true, length: {minimum: 15, maximum: 3000}
    validates :published, presence: true, inclusion: [true, false], allow_blank: true
    has_one_attached :image
end
