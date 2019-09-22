class Api::V1::ApplicationController < ActionController::API

  private
  
  def render_response(status:, obj: nil, errors: {}, message: nil)
    code = Rack::Utils.status_code(status)
    name = Rack::Utils::HTTP_STATUS_CODES[code]
    tmp = {}
    tmp[:body] = obj if obj.present?
    tmp[:errors] = errors if errors.present?
    tmp[:message] = message if message.present?
    tmp[:status] = { code: code, name: name }
    render json: tmp, status: code
  end
end