class Company < ApplicationRecord
  has_rich_text :description
  validates :email,
            format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/, message: 'Email should be of @getmainstreet.com domain' },
            allow_blank: true

end
