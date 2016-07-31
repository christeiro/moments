Fabricator(:user) do
  user_name { (0...8).map { (65 + rand(26)).chr }.join }
  email { Faker::Internet.email }
  password { Faker::Internet.password(8) }
end