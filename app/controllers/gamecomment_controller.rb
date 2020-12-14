class GamecommentController < ApplicationController
  def new
  end
    
  def create
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
  end

  private
  def gamecomment_params
    params.require(:gamecomments).permit()
  end
end
