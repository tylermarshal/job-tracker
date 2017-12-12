## Single Database

[ ] create rails file
* rails new <filename> -T -d="postgresql" --skip-turbolinks --skip-spring
[ ] generate migration
* rails generate migration Create<Name> title:string body:text
[ ] add t.timestamp to migration file
[ ] check to ensure the migration table is setup per the migration columns
[ ] rake db:migrate
[ ] create model file for database & inherit ApplicationRecord
[ ] create a couple rows for that database in rails console
[ ] build the routes (resources :<database name plural>)
[ ] check rails routes to ensure they were set up properly
[ ] create the controller file for database & inherit Application Controller
[ ] define the index action in Controller
[ ] create the index view
* include links to show page
  * each do <%= link_to article.title, article_path(article), class: 'article_title' %>
* include link to create new article
  * <%= link_to "Create a New Article", new_article_path, class: "new_article" %>
[ ] create the show action in controller
[ ] create the show view
* include link back to index page
  * <%= link_to "<< Back to Articles List", articles_path %>
[ ] define the new action in controller
[ ] create the new view
* <%= form_for(@article) do |f| %>
[ ] pull the form part into a partial
* <%= render partial: 'form' %>
[ ] define the create action in controller
[ ] add delete link to show page
* <%= link_to "delete", article_path(@article), method: :delete, data: {confirm: "Really delete the article?"} %>
[ ] add destroy action in controller
[ ] add edit link in show page
* <%= link_to "edit", edit_article_path(@article) %>
[ ] define edit action in controller
[ ] create the edit view
[ ] add flash messages for delete and update
* flash.notice = "Article '#{@article.title}' Updated!" in controller actions
* <p class="flash"><%= flash.notice %></p> above <%= yield %> in app/views/layouts/application.html.erb

## Adding a One to Many database
[ ] generate migration
* add reference to other database in migration (as seen below)
* rails generate migration CreateComments author_name:string body:text article:references
[ ] add t.timestamp to migration file
[ ] check to ensure the migration table is setup per the migration columns
[ ] add belongs_to and has_many relationships
