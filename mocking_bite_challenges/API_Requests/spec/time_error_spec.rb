require 'time_error'

RSpec.describe TimeError do
  it 'returns difference between remote clock and local clock' do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"GMT","client_ip":"51.187.161.91","datetime":"2022-11-17T19:18:34.332720+00:00","day_of_week":4,"day_of_year":321,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668712714,"utc_datetime":"2022-11-17T19:18:34.332720+00:00","utc_offset":"+00:00","week_number":46}')
    time = Time.new(2022, 11, 17, 19, 18, 33)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 1.33272
  end
end