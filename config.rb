###
# Blog settings
###

# Time.zone = "UTC"

activate :syntax

activate :livereload

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end


activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page{num}"
end

activate :directory_indexes

page "/blog/atom.xml", layout: false
page "/blog/*", layout: "blog"
page "/wiki/*", layout: "wiki"
page "/404.html", directory_index: false

helpers do
  def some_helper
    "Helping"
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'
