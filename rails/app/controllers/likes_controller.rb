class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @likable = find_likable
    @like = @likable.likes.build
  end

  def create
    @likable = find_likable
    @like = @likable.likes.build(params[:like])
    @like.person = current_person    
    if @like.save
      redirect_to_likable(@likable)
    else
      redirect_to :back, :error => 'Did not like.'
    end
  end

  def edit
    @like = Like.find(params[:id])
  end

  def update
    @like = Like.find(params[:id])
    if @like.update_attributes(params[:like])
      redirect_to @like, :notice  => "Successfully updated like."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @like = current_person.likes.find(params[:id])
    likable = @like.likable
    @like.destroy
    redirect_to_likable likable
  end
  private
  
  def find_likable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def redirect_to_likable(likable)
    if likable.is_a?(Exhibit)
      redirect_to likable, :notice => 'Successfully liked.'
    else
      redirect_to likable.exhibit, :notice => 'Successfully liked.'
    end
  end
  
end
