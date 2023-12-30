class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]


  validates :email, presence: true, unless: :from_auth?
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])/, message: "deve contenere almeno una cifra, una lettera maiuscola, una lettera minuscola e un carattere speciale" }, unless: :from_auth?
  validates :password_confirmation, presence: true, unless: :from_auth?
  validates :nome, presence: true, unless: :from_auth?
  validates :cognome, presence: true, unless: :from_auth?
  validates :citta, presence: true, unless: :from_auth?
  validates :cap, presence: true, unless: :from_auth?
  validates :provincia, presence: true, unless: :from_auth?
  
  def from_auth?
    provider.present? && (provider == 'github' || provider == 'google_oauth2')
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0,20]
      
      if provider_data.info.has_key?('first_name')
        names = provider_data.info.name.split(' ')
        user.nome = names.first 
        user.cognome = names.last 
      elsif provider_data.info.has_key?('name')
        user.nome = provider_data.info.name.split('-').first
        user.cognome = provider_data.info.name.split('-').last
      end

      if provider_data.info.has_key?('image')
        user.avatar = provider_data.info.image
      elsif provider_data.info.has_key?('picture')
        user.avatar = provider_data.info.picture
      end
    end
  end

  has_many :recensiones
  has_many :prenotaziones
  has_many :ristorantes
  has_many :likes
  has_many :like_recensiones

end
