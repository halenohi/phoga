namespace :phoga do
  desc 'Phogaをインストールするrakeタスクを一気に実行'
  task :install do
    %w(
      phoga:add_config_routes
      phoga:add_db_seeds
      phoga:install:migrations
      db:migrate
      db:seed
    ).each do |task_name|
      Rake::Task[task_name].invoke
    end
  end

  desc 'マウント対象のアプリケーションのconfig/routes.rbにマウントコードを追加'
  task :add_config_routes do
    mount_code = '  mount Phoga::Engine => "/admin"'
    routes_file = File.open(Rails.root.join('config/routes.rb'), 'r+')
    routes_lines = routes_file.read.split("\n")
    mount_code_index = routes_lines.index { |line| line =~ Regexp.new(mount_code) }
    unless mount_code_index
      insert_index = routes_lines.index { |line| line =~ /\.routes\.draw\sdo/ } + 1
      routes_lines.insert(insert_index, mount_code)
      routes_file = nil
      routes_file = File.open(Rails.root.join('config/routes.rb'), 'r+')
      routes_file.write(routes_lines.join("\n"))
    end
  end

  desc 'マウント対象のアプリケーションのdb/seeds.rbにseedをロードするコードを追加'
  task :add_db_seeds do
    load_seed_code = "Phoga::Engine.load_seed"
    seed_file = File.open(Rails.root.join('db/seeds.rb'), 'r+')
    seed_lines = seed_file.read.split("\n")
    load_seed_code_index = seed_lines.index { |line| line =~ Regexp.new(load_seed_code) }
    unless load_seed_code_index
      seed_lines.push(load_seed_code)
      seed_file = nil
      seed_file = File.open(Rails.root.join('db/seeds.rb'), 'r+')
      seed_file.write(seed_lines.join("\n"))
    end
  end
end
