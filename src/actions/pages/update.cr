class Pages::Update < BrowserAction
  put "/pages/:id" do
    page_0 = PageQuery.new.find(id)
    PageForm.update(page_0, params) do |form, page_1|
      if form.saved?
        redirect Index
      else
        render EditPage, page: page_1, form: form
      end
    end
  end
end
