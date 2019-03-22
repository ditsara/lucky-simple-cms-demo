class AddToPage::V20190322133338 < Avram::Migrator::Migration::V1
  def migrate
    alter :pages do
      add published_at : Time?
      add mimetype : String, default: "text/plain"
    end
  end

  def rollback
    alter :pages do
      remove :published_at
      remove :mimetype
    end
  end
end
