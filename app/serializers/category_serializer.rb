class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :vertical_id, :state
end
