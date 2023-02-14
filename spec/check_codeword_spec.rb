require "check_codeword"

RSpec.describe "check_codeword method" do
    it "returns 'Correct! Come in.' if argument == 'horse'" do
        expect(check_codeword("horse")).to eq "Correct! Come in."
    end
    
    it "returns 'Close, but nope.' when argument's first letter == 'h' && last letter == 'e'" do
        expect(check_codeword("handle")).to eq "Close, but nope."
    end

    it "else: returns 'WRONG!'" do
        expect(check_codeword("hairbrush")).to eq "WRONG!"
    end

end