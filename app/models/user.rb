# frozen_string_literal: true

VALID_EMAIL_REGEX = /([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/

class User < ApplicationRecord
  # add associations here.
  has_many :articles

  before_save { self.email = email.downcase }

  # add validations here.
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
