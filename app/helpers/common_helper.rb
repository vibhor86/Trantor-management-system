module CommonHelper
  
  def format_date(date)
    date ? date.strftime("%d/%m/%Y") : ''
  end
  
  def format_time(time)
    time ? time.strftime("%d/%m/%Y, %H:%M:%S") : ''
  end
  
  def datetime_ago(datetime)
    "#{time_ago_in_words(datetime)} ago"
  end
  
  def options_for_country_select
    Country.all.collect{|c| [c.name, c.id]}.unshift(['Select Country', ''])
  end
  
  def options_for_state_select
    State.all.collect{|s| [s.name, s.id]}.unshift(['Select State', ''])
  end
  
end