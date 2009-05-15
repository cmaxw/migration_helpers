require 'migration_helpers'

ActiveRecord::Migration.send :include, MigrationHelpers::ForeignKeyMigrations
ActiveRecord::ConnectionAdapters::MysqlAdapter.send :include, MigrationHelpers::ForeignKeyMigrations