# desc "Explaining what the task does"
# task :phoga do
#   # Task goes here
# end
namespace :phoga do
  task :install do
    %w(
      phoga:install:migrations
      db:migrate
      db:seed
    ).each do |task_name|
      Rake::Task[task_name].invoke
    end
  end

  task :add_config_routes do
    mount_code = '  mount Phoga::Engine => "/admin"'
    routes_file = File.open(Rails.root.join('config/routes.rb'), 'r+')
    routes_lines = routes_file.read.split("\n")
    insert_index = routes_lines.index { |line| line =~ /\.routes\.draw\sdo/ } + 1
    routes_lines.insert(insert_index, mount_code)
    routes_file = nil
    routes_file = File.open(Rails.root.join('config/routes.rb'), 'r+')
    routes_file.write(routes_lines.join("\n"))
  end
end
