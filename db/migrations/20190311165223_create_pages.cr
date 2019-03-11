class CreatePages::V20190311165223 < Avram::Migrator::Migration::V1
  def migrate
    create :pages do
      add title : String
      add slug : String, unique: true
      add body : String?
      add_belongs_to author : User, on_delete: :do_nothing
    end
  end

  def rollback
    drop :pages
  end
end
