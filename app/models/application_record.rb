# frozen_string_literal: true

# Generic application record
class ApplicationRecord < ActiveRecord::Base
  
  self.abstract_class = true

  def build(options={})
    self.attributes
  end

  def self.class_to_sym
    word = self.name
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.tr!("/", "_")
    word.downcase!
    word.to_sym
  end

end
