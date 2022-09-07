class CastMembersController < ApplicationController

   def show
      cm = CastMember.find(params[:id])
      render json: cm
   end

end
