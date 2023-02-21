require "time_error"
require "date"

describe TimeError do
  it "gets server time" do
    time_now = double :time_now
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"utc_datetime":"2023-02-21T13:20:32.639672+00:00"}')
    allow(time_now).to receive(:now).and_return(DateTime.parse("2023-02-21T13:20:32.639672+00:00").to_time)
    
    time_error = TimeError.new(requester_dbl, time_now)
    expect(time_error.send(:get_server_time)).to eq DateTime.parse("2023-02-21 13:20:32.639672 +0000").to_time
  end
  
  it "returns difference between computer time and server time" do
    time_now = double :time_now
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"utc_datetime":"2023-02-21T13:20:32.639672+00:00"}')
    expect(time_now).to receive(:now).and_return(DateTime.parse("2023-02-21T13:20:32.639672+00:00").to_time)
    time_error = TimeError.new(requester_dbl, time_now)  
    expect(time_error.error).to eq 0
  end
end