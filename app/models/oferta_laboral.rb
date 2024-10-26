class OfertaLaboral < ApplicationRecord
  belongs_to :user
  has_many :postulaciones, dependent: :destroy
  
  validates :titulo, presence: true
end
