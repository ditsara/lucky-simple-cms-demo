class Pages::Create < BrowserAction
  post "/pages" do
    PageForm.create(params, author: current_user) do |form, page|
      if page
        redirect Index
      else
        render NewPage, form: form
      end
    end
  end
end
