require 'test_helper'

class CosmeTest < ActiveSupport::TestCase
  teardown do
    Cosme.instance_variable_set(:@cosmetics, nil)
  end

  test 'has a version number' do
    refute_nil Cosme::VERSION
  end

  test '#define sets Hash as @cosmetics' do
    Cosme.define(target: '.example', action: :before)
    cosmetics = Cosme.instance_variable_get(:@cosmetics)
    assert_instance_of Hash, cosmetics
    refute_empty cosmetics
  end

  test '#default_file_path_for returns a path without extension' do
    caller_path = 'path/to/file.rb'
    assert_equal Cosme.default_file_path_for(caller_path), 'path/to/file'
  end

  test '#all returns the values of @cosmetics' do
    Cosme.define(target: '.example', action: :before)
    cosmetics = Cosme.instance_variable_get(:@cosmetics)
    assert_equal Cosme.all, cosmetics.values
  end
end
