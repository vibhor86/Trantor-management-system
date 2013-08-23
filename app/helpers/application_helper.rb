module ApplicationHelper
  
  # If controller is admin?
  def admin_namespace?
    controller.class.name.split('::').first == 'Admin'
  end
  
  def leaves_balances(type_id)
    balance_instance =  Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,type_id)
    balance_instance ?  balance_instance.balance : 0
  end  
end
