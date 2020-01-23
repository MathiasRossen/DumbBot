require "active_record"
require "require_all"

namespace :db do
  db_config = YAML::load(File.open("config/database.yml"))

  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::MigrationContext.new("db/migrate", schema_migrations).migrate

    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require "active_record/schema_dumper"
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

  def schema_migrations
    ActiveRecord::SchemaMigration.tap do |sm|
      sm.create_table
    end
  end
end

task :bot do
  exec "bundle exec ruby dumbbot.rb"
end