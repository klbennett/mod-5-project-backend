class Api::V1::ListItemsController < ApplicationController

  def show
     @list_item = ListItem.find_by(id: params[:id])
        if @list_item 
            render json: @list_item
        else
            render json: {error: "List Item not found"}, status: 500
        end
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
        @user = User.all.find{|user| user.id === @list_item.list.user_id}
        # byebug
        @user_lists = @user.lists
        @list_item.destroy
        render json: @user_lists
    end

end
