require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron '0 0 1 * *' do
  leavetype = LeaveType.find_by_name('EL')
  if leavetype
    balances =  Leavebalance.all(:conditions =>{:leave_type_id => leavetype.id } ) 
    balances.collect do |bl| 
     if bl.balance < 36
       bl.balance += 1
       bl.save!
     end
    end
  end
end

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
