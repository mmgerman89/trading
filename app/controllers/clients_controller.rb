class ClientsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[test]
  before_action :allow_iframe_requests, only: %i[test]
  layout 'client'

  def home; end

  def test
    @satelite = params[:satelite]
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
