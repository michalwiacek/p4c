class UniqNameValidator < ActiveModel::Validator

  def validate(record)
    message = 'must by unique across Categories and Verticals'
    if Vertical.find_by(name: record.name) or Category.find_by(name: record.name)
      record.errors[:name] << message
    end
  end

end
