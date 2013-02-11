module EmployeeHelper
  def setspan
    current_user.confirmed? ? 'span10' : ''
  end
end
