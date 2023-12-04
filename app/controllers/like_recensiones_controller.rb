class LikeRecensionesController < ApplicationController
  before_action :require_login
  
  # POST /like_recensiones or /like_recensiones.json
  def create
    @like_recensione=current_user.like_recensiones.new(like_recensione_params)
    if !@like_recensione.save
      flash[:notice]=@like_recensione.errors.full_messages.to_sentence
    end
    #redirect_to @like_recensione.recensione.ristorante
    render turbo_stream: turbo_stream.replace(
      "likerec_form_#{@like_recensione.recensione_id}",
      partial:"ristorantes/ristorante_like_recensione_form",
      locals: {recensione_id: @like_recensione.recensione_id}
    )
  end


  # DELETE /like_recensiones/1 or /like_recensiones/1.json
  def destroy
    @like_recensione=current_user.like_recensiones.find(params[:id])
    recensione=@like_recensione.recensione
    @like_recensione.destroy
    #redirect_to recensione.ristorante
    render turbo_stream: turbo_stream.replace(
      "likerec_form_#{recensione.id}",
      partial:"ristorantes/ristorante_like_recensione_form",
      locals: {recensione_id: recensione.id}
    )
  end

  private
    # Only allow a list of trusted parameters through.
    def like_recensione_params
      params.require(:like_recensione).permit(:recensione_id)
    end

  protected

  def require_login
    if !user_signed_in?
      flash[:warning] = 'Devi accedere con il tuo account'
      redirect_to new_user_session_path
    end
  end
end
