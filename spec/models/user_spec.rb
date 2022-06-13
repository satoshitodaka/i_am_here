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
require 'rails_helper'

RSpec.describe User, type: :model do
  xit pending "add some examples to (or delete) #{__FILE__}"
end
