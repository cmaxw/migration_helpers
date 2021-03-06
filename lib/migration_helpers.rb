module MigrationHelpers
  module ForeignKeyMigrations
    def add_foreign_key(from_table, from_column, to_table, to_column = "id", constraint_name = nil)
      constraint_name ||= "fk_#{from_table}_#{from_column}"[0,64]
      execute %{alter table #{from_table} add constraint #{constraint_name} foreign key(#{from_column}) references #{to_table}(#{to_column}) on delete cascade}
    end

    def foreign_key(from_table, from_column, to_table, constraint_name = nil)
      add_foreign_key(from_table, from_column, to_table, "id", constraint_name)
    end

    def drop_foreign_key(from_table, from_column)
      constraint_name ||= "fk_#{from_table}_#{from_column}"[0,64]
      drop_foreign_key_by_constraint_name(from_table, constraint_name)
    end

    def drop_foreign_key_by_constraint_name(from_table, constraint_name = nil)
      execute %{alter table #{from_table} drop foreign key #{constraint_name}}
      execute %{alter table #{from_table} drop key #{constraint_name}}
    end
  end
end