module ApplicationHelper
  def leaves_type
#   leave =  ['EL' ,	'CL', 	'CO' ,	'SL']
#   leave_objects = []
#   leave.each do |lv|
#    leave_objects << LeaveType.find_by_name(lv)
#   end
    LeaveType.all
  end
  def leaves_balances(type_id)
   balance_instance =  Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,type_id)
    balance_instance ?  balance_instance.balance : 0
  end  
end
