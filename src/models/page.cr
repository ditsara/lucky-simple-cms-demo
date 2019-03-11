class Page < BaseModel
  table :pages do
    column title : String
    column slug : String
    column body : String?
  end
end
