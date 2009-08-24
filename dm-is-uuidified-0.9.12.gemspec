Gem::Specification.new do |s|
  s.name = %q{dm-is-uuidified}
  s.version = "0.9.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hedley Robertson"]
  s.date = %q{2009-08-23}
  s.description = %q{DataMapper plugin enabling simple uuid generation on creation or update of models}
  s.email = ["hedley [daht] robertson [aht] [gee] mail [daht] com"]
  s.extra_rdoc_files = ["README.txt", "LICENSE", "TODO", "History.txt"]
  s.files = ["History.txt", "LICENSE", "Manifest.txt", "README.txt", "Rakefile", "TODO", "lib/dm-is-uuidified.rb", "lib/dm-is-uuidified/uuid.rb", "lib/dm-is-uuidified/is/version.rb", "lib/dm-is-uuidified/is/uuidified.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/uuidified_spec.rb", "tasks/install.rb", "tasks/spec.rb"]
  s.homepage = %q{http://github.com/datamapper/dm-more/tree/master/dm-is-uuidified}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{DataMapper plugin enabling simple uuid generation on creation or update of models}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["= 0.9.12"])
    else
      s.add_dependency(%q<dm-core>, ["= 0.9.12"])
    end
  else
    s.add_dependency(%q<dm-core>, ["= 0.9.12"])
  end
end
