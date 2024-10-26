class Postulacion < ApplicationRecord
  belongs_to :user
  belongs_to :oferta_laboral

  validates :user_id, uniqueness: { scope: :oferta_laboral_id }
end
