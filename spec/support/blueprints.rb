require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.full_name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }
Sham.address { Bitcoin.random_address }

User.blueprint do
  full_name 
  email
  password               { 'super secret' }
  password_confirmation  { 'super secret' }
end

Site.blueprint do
  name { "#{Faker::Name.name}'s BPS" }
end

BitcoinAddress.blueprint do
  address      { Bitcoin.random_address.address }
  private_key  { Bitcoin.random_address.private_key }
  public_key   { Bitcoin.random_address.public_key }
  description  { Sham.body }
end

Payment.blueprint do
  bitcoin_address
  description { Sham.body }
end