require "password_checker"

RSpec.describe PasswordChecker do
    context "check(password) method" do
        it "returns true if password is 8 chars" do
            pwd = PasswordChecker.new
            check_pwd = pwd.check("12345678")
            expect(check_pwd).to eq true
        end

        it "returns true if password is above 8 chars" do
            pwd = PasswordChecker.new
            check_pwd = pwd.check("123456789")
            expect(check_pwd).to eq true
        end

        it "fails if password is below 8 chars" do
            pwd = PasswordChecker.new
            expect { pwd.check("1234567") }.to raise_error "Invalid password, must be 8+ characters."
        end

        it "fails if an integer is passed as an argument" do
            pwd = PasswordChecker.new
            expect { pwd.check(2) }.to raise_error NoMethodError
        end

        it "fails if nothing is passed in the argument" do
            pwd = PasswordChecker.new
            expect { pwd.check }.to raise_error ArgumentError
        end
    end
end