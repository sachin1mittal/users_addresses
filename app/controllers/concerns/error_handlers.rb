module Concerns::ErrorHandlers
  extend ::ActiveSupport::Concern

  def render_unprocessable_entity(e)
    handle_error(e.message)
  end

  def render_invalid_entity(e)
    handle_error(e.message)
  end

  private

  def handle_error(message)
    flash[:danger] = message
    if request.referrer.present?
      redirect_to :back
    else
      redirect_to root_path
    end
  end

end
