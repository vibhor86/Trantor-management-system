require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

#end of month
scheduler.cron '0 0 1 * *' do  
  User.all.collect{|user| 
    if user.emptype.name == "Trainee"
      leavetype = LeaveType.find_by_name('CL')
      leave_balance =  Leavebalance.all(:conditions =>{:leave_type_id => leavetype.id , :user_id => user.id } )
      leave_balance.balance = 1
      leave_balance.save!
    else
      leavetype = LeaveType.find_by_name('EL')
      materny_leavetype = LeaveType.find_by_name('ML')
    if Leavemanagement.exists?(['start_date > ? AND start_date < ? AND leave_type_id = ? AND user_id', Date.today.beginning_of_month, Date.today ,materny_leavetype.id,user.id ])
      leave_balance =  Leavebalance.all(:conditions =>{:leave_type_id => leavetype.id , :user_id => user.id } ) 
      if leave_balance.balance < 36
        leave_entry = Leavemanagement.exists?(['start_date > ? AND start_date < ?', "2012-02-02", "2012-02-02"])
        leave_balance.balance += 1
        leave_balance.save
        if  ["30", "33" ,"36"].include? (leave_balance_of_user = leave_balance.balance.to_s )
          case leave_balance_of_user
            when "30" 
              message = "Your earned leaves balance is 30, please encash your leaves as there will be no further addition of earned leaves after the balance reaches 36."
              AdminMailer.exceed( message, current_user, user, false).deliver
            when "33"
              message = "The earned leave balance of #{current_user.ecode} , #{current_user.name} has reached 33."
              AdminMailer.exceed(message , current_user, user, true).deliver 
            when "36"
              message = "Your earned leaves balance is 36, please encash your leaves as there will be no further addition of earned leaves for you."
              AdminMailer.exceed(message , current_user, user, false).deliver
          end
       end
       end
    end  
    end
  }
end

#end of year
scheduler.cron '0 0 1 1 *' do   
  leaveType_sl = LeaveType.find_by_name('FSL')
  leaveType_cl = LeaveType.find_by_name('CL')
  if leaveType_sl && leaveType_cl
    balances =  Leavebalance.all(:conditions =>{:leave_type_id => [leaveType_sl.id,leaveType_cl.id] } ) 
    balances.collect do |bl|
      bl.balance = 0
      bl.save!
    end
  end
end
