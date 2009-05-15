require 'migration_helpers'

ActiveRecord::Migration.send :include, MigrationHelpers::ForeignKeyMigrations