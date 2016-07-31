Fabricator(:user) do
  user_name { Faker::Internet.user_name('test') }
  email { Faker::Internet.email }
  password { Faker::Internet.password(8) }

end