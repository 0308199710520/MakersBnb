require_relative "../lib/user.rb"

describe "User" do
  it { is_expected.to respond_to(:create) }
end