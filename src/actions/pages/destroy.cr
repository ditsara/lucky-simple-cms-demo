class Pages::Destroy < BrowserAction
  delete "/pages/:id" do
    PageQuery.new.find(id).delete
    redirect Index
  end
end
