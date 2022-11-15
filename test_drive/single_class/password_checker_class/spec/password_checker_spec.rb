require "password_checker"

RSpec.describe PasswordChecker do
  it "checks the length of a password" do
    password_checker = PasswordChecker.new
    expect { password_checker.check("hello") }.to raise_error "Invalid password, must be 8+ characters."
  end

  it "checks if a password is longer than 8 characters" do
    password_checker = PasswordChecker.new
    expect(password_checker.check("password!")).to eq true
  end
end
