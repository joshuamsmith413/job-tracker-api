class User < ApplicationRecord
  has_many :job_applications, dependent: :destroy
  has_secure_password
  validates :name, uniqueness: true
end
