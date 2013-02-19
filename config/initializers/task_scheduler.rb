require 'rubygems'
require 'rufus/scheduler'
require 'net/http'
scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
  ecodes = User.all.map(& :ecode).join(',')
  url = URI.parse('http://192.168.173.55:4567/tables.json')
  full_path = "#{url.path}?data=#{ecodes}"
  req = Net::HTTP::Post.new(full_path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
adsents = res.body

unless adsents.blank?  || res.code != "200"
 abs_array =  adsents.split(',')
   abs_array.each do |ab|
      Absent.create(:ecode => ab , :date => DateTime.now )
   end
 end
end