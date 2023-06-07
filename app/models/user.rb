class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_commit :update_clearbit_user, on: [:create, :update]

  def update_clearbit_user
    UpdateUserJob.perform_later(self)
  end
end
