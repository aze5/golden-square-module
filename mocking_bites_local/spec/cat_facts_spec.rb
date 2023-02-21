require "cat_facts"

describe CatFacts do
  it "provides cat fact" do
    requester = double :requester
    expect(requester).to receive(:get).with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"According to Hebrew legend, Noah prayed to God for help protecting all the food he stored on the ark from being eaten by rats. In reply, God made the lion sneeze, and out popped a cat."}')
    fact = CatFacts.new(requester)  
    expect(fact.provide).to eq "Cat fact: According to Hebrew legend, Noah prayed to God for help protecting all the food he stored on the ark from being eaten by rats. In reply, God made the lion sneeze, and out popped a cat."
  end
end