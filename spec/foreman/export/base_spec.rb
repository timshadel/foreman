require "spec_helper"
require "foreman/engine"
require "foreman/export/base"
require "tmpdir"

describe Foreman::Export::Bluepill do
  let(:procfile) { FileUtils.mkdir_p("/tmp/app"); write_procfile("/tmp/app/Procfile") }
  let(:engine) { Foreman::Engine.new(procfile, :port => 0) }

  it "doesn't allow port 0 during export" do
    expect { Foreman::Export::Bluepill.new(engine) }.to raise_exception Foreman::Export::Exception, "PORT cannot be 0 for export."
  end

end