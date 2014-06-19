require 'rails_helper'

describe Product do

let(:user) { User.creeate(name: "test", email: "test@test.com", url: "test_url.com", mission: "hello world", password: "password", password_confirmation: "password")}
before { @product = Product.new(name: "product", requirement: 100, reward: "test")}	

end
