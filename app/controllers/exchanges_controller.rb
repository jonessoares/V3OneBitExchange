class ExchangesController < ApplicationController
  def index
  end

  def convert
  	value = ExchangeService.new(params[:source_currency,:target_cuurency], params[:amount]).call
  	render json: {'value':value}
  end
end
