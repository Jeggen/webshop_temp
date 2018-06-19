class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  validates_presence_of :email, :message => "* Dit is een verplicht veld"

  private

  def create_profile
    Profile.create(:user_id => self.id, :customer_number => (self.id).to_s + SecureRandom.hex(4))
  end
end
