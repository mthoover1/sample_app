# Returns the full title on a per-page basis.
def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

# From sessions_helper
def sign_in(user)
  cookies.permanent[:remember_token] = user.remember_token
  self.current_user = user
end

def signed_in?
  !current_user.nil?
end

def current_user=(user)
  @current_user = user
end

def current_user
  @current_user ||= User.find_by_remember_token(cookies[:remember_token])
end

def sign_out
  self.current_user = nil
  cookies.delete(:remember_token)
end

# Returns the Gravatar (http://gravatar.com/) for the given user.
def gravatar_for(user, options = { size: 80 })
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  size = options[:size]
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  image_tag(gravatar_url, alt: user.name, class: "gravatar")
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end