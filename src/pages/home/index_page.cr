class Home::IndexPage < GuestLayout
  def content
    h1 "Home"
    para "This is the home page."
    link "Sign In", to: SignIns::New
  end
end
