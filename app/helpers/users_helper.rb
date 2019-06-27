module UsersHelper
  def user_name(name)
    name.presence || '名無しさん'
  end
end
