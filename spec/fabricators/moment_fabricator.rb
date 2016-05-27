Fabricator(:moment) do
  caption { Faker::Lorem.words(2).join(' ') }
  image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg')
end