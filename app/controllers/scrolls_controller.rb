class ScrollsController < ApplicationController
  include ScrollsHelper

  def index
  	@state = State.find(7)
  	@states = State.all
  	respond_to do |format|
      format.json{render json:@states}
    end
  end

  def show
  	minimum = 0 || params[:min].to_i
  	maximum = 100 || params[:max].to_i
  	@outside = (params[:outside]).to_s
  	@inside = (params[:inside]).to_s
    @state = State.where("#{params[:outside]}.#{params[:inside].to_s}" => minimum..maximum)
  	#byebug
    respond_to do |format|
      format.html {render partial: 'show'}
    end
  end
end
