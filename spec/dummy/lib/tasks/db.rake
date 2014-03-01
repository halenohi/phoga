namespace :phoga do
  desc 'PhogaのDBを構築し直す'
  task :db_reset do
    require 'fileutils'
    migrate_dir = Rails.root.join('db', 'migrate')
    FileUtils.remove_dir(migrate_dir) if File.directory?(migrate_dir)
    FileUtils.remove(Dir.glob(Rails.root.join('db', '*.sqlite3')))
    FileUtils.remove(Dir.glob(Rails.root.join('db', 'schema.rb')))
    Rake::Task["phoga:install:migrations"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    Rake::Task["db:test:prepare"].invoke
  end
end
