require 'net/http'
require 'json'

# Clear existing data
Breed.destroy_all
Image.destroy_all
Group.destroy_all

# Create groups
groups = ["Working", "Sporting", "Hound", "Terrier", "Toy", "Non-Sporting", "Herding"]
group_records = groups.map { |group| Group.create(name: group) }

# Fetch data from Dog API
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
breed_list = JSON.parse(response)['message']

breed_list.each do |breed, sub_breeds|
  group = group_records.sample  # Assign a random group to each breed
  breed_record = Breed.create(name: breed, group: group)

# Fetch images for the breed

  image_url = "https://dog.ceo/api/breed/#{breed}/images/random/5"
  image_uri = URI(image_url)
  image_response = Net::HTTP.get(image_uri)
  images = JSON.parse(image_response)['message']

  images.each do |image|
    Image.create(url: image, breed: breed_record)
  end
end

puts "Seeding completed successfully!"
