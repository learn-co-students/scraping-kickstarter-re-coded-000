# require libraries/modules here
require 'nokogiri'

require 'pry'
def create_project_hash
  # write your code here
  projects={}
  html = File.read('fixtures/kickstarter.html')
 kickstarter = Nokogiri::HTML(html)
 projects_=kickstarter.css("li.project.grid_4")
 projects_.each do |project|
   title=project.css("h2.bbcard_name strong a").text
   projects[title]={}
   image_link=project.css("div.project-thumbnail a img").attribute("src").value
   description=project.css("p.bbcard_blurb").text
   location=project.css("span.location-name").text
   percent_funded=project.css("ul.project-stats li.first.funded strong").text.sub!("%","").to_i
   project.css().text
   projects[title][:image_link]=image_link
   projects[title][:description]=description
   projects[title][:location]=location
   projects[title][:percent_funded]=percent_funded

 end
 return projects
end
puts create_project_hash
