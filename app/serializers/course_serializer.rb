class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :author, :categories, :state
end
