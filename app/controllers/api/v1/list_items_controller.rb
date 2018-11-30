class Api::V1::ListItemsController < ApplicationController
  def show
  end

  def create
    @list_item = ListItem.create(list_id: params[:list_id], extract: params[:extract], body: params[:body], date: params[:date], debate: params[:debate], speaker: params[:speaker], speakerCons: params[:speakerCons], speakerParty: params[:speakerParty], speakerId: params[:speakerId])
    # byebug  
    if @list_item.save
          render json: @list_item
      else
          render json: {error: "Could not add item to list"}
      end
  end

  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    end

end
