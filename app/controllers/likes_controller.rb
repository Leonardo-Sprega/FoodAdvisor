class LikesController < ApplicationController
  before_action :require_login
  
  # POST /likes or /likes.json
  def create
    @like=Current.user.likes.new(like_params)
    if !@like.save
      flash[:notice]=@like.errors.full_messages.to_sentence
    end
    redirect_to @like.ristorante
  end


  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like=Current.user.likes.find(params[:id])
    ristorante=@like.ristorante
    @like.destroy
    redirect_to ristorante
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:ristorante_id)
    end

  protected

  def require_login
    unless Current.user
      flash[:warning] = 'Devi accedere con il tuo account'
      redirect_to login_path
    end
  end
end
