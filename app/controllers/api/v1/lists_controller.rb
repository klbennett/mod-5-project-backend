class Api::V1::ListsController < ApplicationController

   def create
        @user = get_current_user
        @list = List.create(title: params[:title], user_id: @user.id)
        if @list.save 
            render json: @list
        else
            render json: {error: 'Could not save list. Have you logged in?'}, status: 400
        end
    end

      def show
        @list = List.find_by(id: params[:id])
        if @list 
            render json: @list
        else
            render json: {error: "List not found"}, status: 500
        end
    end

     def destroy
        @list = List.find(params[:id])
        if @list
            @list_items = ListItem.all.select{|list_item| list_item.list_id === @list.id}
            @list_items.map{|li| li.destroy}
            @list.destroy
        else
            render json: {error: "List not found"}, status: 500
        end
    end
 
end
