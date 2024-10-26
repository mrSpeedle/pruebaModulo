class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :foto_perfil
         has_one_attached :cv 


         has_many :postulaciones, class_name: "Postulacion"
         has_many :ofertas_laborales, dependent: :destroy
         enum role: { normal: 0, admin: 1 }
end
