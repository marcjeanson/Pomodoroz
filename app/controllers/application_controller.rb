class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
  def record_not_found
    render text: "Sorry, we couldn't find that record for you.", status: 404
  end
end
