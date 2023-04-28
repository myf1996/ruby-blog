require "#{Rails.root}/lib/custom_exception/exception_error.rb"

class ApplicationController < ActionController::Base
  rescue_from ExceptionError, with: :exception_error

  def exception_error(error)
    render json: { message: error.message }, status: error.status_code
  end
end
