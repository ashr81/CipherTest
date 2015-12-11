class CipherController < ApplicationController
  helper_method :for_view
  include CipherHelper
  def index
    @@state = State.limit(10)
  	@state = State.find(7)
  end
  def show
    @state = State.find(7)
    minimum = 0 || params[:min].to_i
    maximum = 100 || params[:max].to_i
    #byebug
  	@@state = for_view.where("#{params[:cClass]}.#{params[:cId]}" => params[:min].to_i..params[:max].to_i).limit(10)
  	respond_to do |format|
  		format.html {render partial: 'show'}
  		format.json {render json: @@state}
  	end
    #byebug
  end
  
  def output
    @states = State.all
    @search_suggest = State.where(name: params[:name])
    respond_to do |format|
      format.html {render partial: 'output'}
      format.json {render json: @search_suggest }
    end
  end

  def state_data
    @state_data = CipherHelper.convert_to_array(State.where(name: params[:name]))
    respond_to do |format|
      format.json {render json: @state_data}
    end
  end
  def search_suggestions
    @search_suggest = State.pluck(:name)
    #byebug
    respond_to do |format|
      format.json {render json: @search_suggest}
    end
  end
  def for_view
    @@state ||= State.all
  end
end
