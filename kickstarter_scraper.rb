# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta a span")[1].text
# percentage: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}
  
  # iterate through the projects
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image link => project.css("div.project-thumbnail a img").attribute("src").value, 
      :description => project.css("p.bbcard_blurb").text, 
      :location => project.css("ul.project-meta a span")[1].text,
      :percentage => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
  
  #return the projects create_project_hash
  projects
end

