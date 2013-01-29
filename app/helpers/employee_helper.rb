module EmployeeHelper
  def setspan
    current_user.confirmed? ? 'span9' : ''
  end
end
