require "./user"

class Page < BaseModel
  table :pages do
    column title : String
    column slug : String
    column body : String?
    column published_at : Time?
    column mimetype : String
    belongs_to author : User?
  end
end
