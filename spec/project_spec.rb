require "spec_helper"

RSpec.describe Project do
  it "has a version number" do
    expect(Project::VERSION).not_to be nil
  end
end
