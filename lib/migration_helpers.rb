module ForeignKeyMigrations
  def self.add_foreign_key(from_table, from_column, to_table, to_column = "id", constraint_name = nil)
    constraint_name ||= "fk_#{from_table}_#{from_column}"[0,64]

    execute %{alter table #{from_table} add constraint #{constraint_name} foreign key(#{from_column}) references #{to_table}(#{to_column}) on delete cascade}
  
  end

  def self.foreign_key(from_table, from_column, to_table, to_column = "id", constraint_name = nil)
    add_foreign_key(from_table, from_column, to_table, to_column, constraint_name)
  end

  def self.drop_foreign_key(from_table, from_column)
    constraint_name ||= "fk_#{from_table}_#{from_column}"[0,64]

    execute %{alter table #{from_table} drop foreign key #{constraint_name}}
  end

  def self.drop_foreign_key_by_constraint_name(from_table, constraint_name = nil)
    execute %{alter table #{from_table} drop foreign key #{constraint_name}}
  end
end
