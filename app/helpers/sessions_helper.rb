module SessionsHelper
  def invalid?
    @error_login != nil
  end
end