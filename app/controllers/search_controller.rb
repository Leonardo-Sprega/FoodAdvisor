class SearchController < ApplicationController
    def index
        @results = search_for_ristorante

        respond_to do |format|
            format.turbo_stream do
                render turbo_stream:
                    turbo_stream.update("ristoranti",
                    partial: "ristorantes/ristorantes",
                locals: {ristorantes: @results})
            end
        end
    end

    def suggestions
        @results = search_for_ristorante

        respond_to do |format|
            format.turbo_stream do
                render turbo_stream:
                    turbo_stream.update("suggestions",
                    partial: "search/suggestions",
                locals: {results: @results})
            end
        end
    end


    private
    def search_for_ristorante
        @results = if params[:query].blank?
            Ristorante.all
        else
            Ristorante.search(params[:query], fields: %i[nome], operator: "or", match: :text_middle)
        end
    end

end
