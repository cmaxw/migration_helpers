require 'migration_helpers'

ActiveRecord::Migration.send :extend, MigrationHelpers::ForeignKeyMigrations