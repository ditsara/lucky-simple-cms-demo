class CreatePages::V20190311165851 < Avram::Migrator::Migration::V1
  def migrate
    # create :things do
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
  end

  def rollback
    # drop :things
  end
end
