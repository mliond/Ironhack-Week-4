# How to create static pages for Rails

1. Create the route
	file: config/routes.rb
 	code: ``` get '/' => 'sites#home' ```
2. Create the controller
	terminal: rails generate controller Sites
3. Create the action on the controller
	file: app/controllers/sites_controller.rb
	code: ``` def home ```
4. Create the view
	file: app/views/sites/home.html.erb