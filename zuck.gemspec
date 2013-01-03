# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "zuck"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jannis Hermanns"]
  s.date = "2013-01-03"
  s.description = "This gem allows to easily access facebook's ads api in ruby. See https://developers.facebook.com/docs/reference/ads-api/"
  s.email = "jannis@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".rvmrc",
    ".travis.yml",
    ".yardopts",
    "CHANGELOG.markdown",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile.dist",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "console",
    "lib/zuck.rb",
    "lib/zuck/facebook/ad_account.rb",
    "lib/zuck/facebook/ad_campaign.rb",
    "lib/zuck/facebook/ad_creative.rb",
    "lib/zuck/facebook/ad_group.rb",
    "lib/zuck/facebook/targeting_spec.rb",
    "lib/zuck/fb_object.rb",
    "lib/zuck/fb_object/dsl.rb",
    "lib/zuck/fb_object/error.rb",
    "lib/zuck/fb_object/hash_delegator.rb",
    "lib/zuck/fb_object/helpers.rb",
    "lib/zuck/fb_object/read.rb",
    "lib/zuck/fb_object/read_only.rb",
    "lib/zuck/fb_object/write.rb",
    "lib/zuck/koala/koala_methods.rb",
    "spec/fixtures/a_single_account.yml",
    "spec/fixtures/a_single_campaign.yml",
    "spec/fixtures/create_ad_campaign.yml",
    "spec/fixtures/create_ad_group.yml",
    "spec/fixtures/delete_ad_group.yml",
    "spec/fixtures/find_a_single_campaign_and_update_it.yml",
    "spec/fixtures/list_of_ad_accounts.yml",
    "spec/fixtures/list_of_ad_campaigns.yml",
    "spec/fixtures/list_of_ad_creatives.yml",
    "spec/fixtures/list_of_ad_groups.yml",
    "spec/fixtures/list_of_all_ad_creatives_of_account.yml",
    "spec/fixtures/reach_for_invalid_keyword.yml",
    "spec/fixtures/reach_for_valid_keywords.yml",
    "spec/fixtures/reach_for_valid_keywords_male_young.yml",
    "spec/lib/zuck/facebook/ad_account_spec.rb",
    "spec/lib/zuck/facebook/ad_campaign_spec.rb",
    "spec/lib/zuck/facebook/targeting_spec_spec.rb",
    "spec/lib/zuck/fb_object/helpers_spec.rb",
    "spec/lib/zuck/koala/koala_methods_spec.rb",
    "spec/lib/zuck/util/hash_delegator_spec.rb",
    "spec/lib/zuck_spec.rb",
    "spec/spec_helper.rb",
    "spec/vcr_setup.rb",
    "zuck.gemspec"
  ]
  s.homepage = "http://github.com/jayniz/zuck"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Ruby adapter to facebook's ad api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rvm>, [">= 0"])
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<koala>, [">= 1.5"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-bundler>, [">= 0"])
      s.add_development_dependency(%q<guard-yard>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
    else
      s.add_dependency(%q<rvm>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<koala>, [">= 1.5"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<guard-bundler>, [">= 0"])
      s.add_dependency(%q<guard-yard>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, [">= 0"])
    end
  else
    s.add_dependency(%q<rvm>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<koala>, [">= 1.5"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<guard-bundler>, [">= 0"])
    s.add_dependency(%q<guard-yard>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, [">= 0"])
  end
end

