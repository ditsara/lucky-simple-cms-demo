require "./app"

if Lucky::Env.development?
  Avram::Migrator::Runner.new.ensure_migrated!
end
Habitat.raise_if_missing_settings!

app = App.new

Signal::INT.trap do
  app.close
end

app.listen
