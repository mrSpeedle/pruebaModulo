class OfertaLaboral < ApplicationRecord
  belongs_to :user
  has_many :postulaciones, class_name: 'Postulacion', dependent: :destroy
  
  validates :titulo, presence: true
  validates :descripcion, presence: true
end
