class User < ApplicationRecord
  has_many :job_applications
  has_secure_password
end
