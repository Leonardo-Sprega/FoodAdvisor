class LikesController < ApplicationController
  before_action :require_login
  
  # POST /likes or /likes.json
  def create
    @like=current_user.likes.new(like_params)
    if !@like.save
      flash[:notice]=@like.errors.full_messages.to_sentence
    end
    #redirect_to @like.ristorante
    render turbo_stream:
      turbo_stream.replace("like_bottone",
        partial:"ristorantes/ristorante_like_form",
        locals: {ristorante_id: @like.ristorante.id})
  end


  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like=current_user.likes.find(params[:id])
    ristorante=@like.ristorante
    @like.destroy
    render turbo_stream:
      turbo_stream.replace("like_bottone",
        partial:"ristorantes/ristorante_like_form",
        locals: {ristorante_id: ristorante.id})
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:ristorante_id)
    end

  protected

  def require_login
    if !user_signed_in?
      flash[:warning] = 'Devi accedere con il tuo account'
      redirect_to new_user_session_path
    end
  end
end
