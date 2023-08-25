class LikeRecensionesController < ApplicationController
  before_action :require_login

  # POST /like_recensiones or /like_recensiones.json
  def create
    @like_recensione=Current.user.like_recensiones.new(like_recensione_params)
    if !@like_recensione.save
      flash[:notice]=@like_recensione.errors.full_messages.to_sentence
    end
    redirect_to @like_recensione.recensione.ristorante
  end


  # DELETE /like_recensiones/1 or /like_recensiones/1.json
  def destroy
    @like_recensione=Current.user.like_recensiones.find(params[:id])
    recensione=@like_recensione.recensione
    @like_recensione.destroy
    redirect_to recensione.ristorante
  end

  private
    # Only allow a list of trusted parameters through.
    def like_recensione_params
      params.require(:like_recensione).permit(:recensione_id)
    end

  protected

  def require_login
    unless Current.user
      flash[:warning] = 'Devi accedere con il tuo account'
      redirect_to login_path
    end
  end
end
