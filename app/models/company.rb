class Company < ApplicationRecord
  has_rich_text :description
  validates :email,
            format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/, message: 'Email should be of @getmainstreet.com domain' },
            allow_blank: true

  validates_format_of :zip_code,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "Zip code is not valid"

  before_save :set_city_state

  def set_city_state
   return {} unless zip_code.present?
   zip_data = ZipCodes.identify(zip_code)
    if zip_data
      self.city = zip_data[:city]
      self.state = zip_data[:state_code]
   end
  end

end
