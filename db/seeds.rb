Course.destroy_all
Category.destroy_all
Author.destroy_all
Vertical.destroy_all

verticals = ["Health & Fitness", "Business", "Music"]

verticals.each do |name|
  Vertical.create!(name: name)
end


categories = JSON.parse(File.read('data/categories.json'))
data = []
categories.each do |f|
  object = {
    "id": f["Id"],
    "name": f["Name"],
    "vertical_id": f["Verticals"],
    "state": f["State"],
  }
  data << object
end
Category.create!(data)

courses = JSON.parse(File.read('data/courses.json'))
data = []
courses.each do |f|
  object = {
    "id": f["Id"],
    "name": f["Name"],
    "author": Author.find_or_create_by(name: f["Author"]),
    "category_id": f["Categories"],
    "state": f["State"]
  }
  data << object
end
Course.create!(data)