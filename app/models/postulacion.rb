class Postulacion < ApplicationRecord
  belongs_to :user
  belongs_to :oferta_laboral
  has_one_attached :cv

  validates :user_id, uniqueness: { scope: :oferta_laboral_id }
end
