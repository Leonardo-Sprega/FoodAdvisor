class TipoCucina < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "descrizione", "id", "nome", "updated_at"]
    end

end
