require "present"

RSpec.describe Present do
    it "wraps and unwraps a value" do
        present = Present.new
        present.wrap("hello")
        expect(present.unwrap).to eq "hello"
    end
    
    it "fails when content has been wrapped already" do
        present = Present.new
        present.wrap("gift")
        expect { present.wrap("car") }.to raise_error("A contents has already been wrapped.")
    end  

    it "fails when no content has been wrapped" do 
        present = Present.new
        expect { present.unwrap }.to raise_error("No contents have been wrapped.")
    end
end