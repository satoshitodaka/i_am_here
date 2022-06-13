# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  username         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_passwword] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_passwword] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_passwword] }
end
