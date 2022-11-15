require "present"

RSpec.describe Present do
  it "fails without wrapping first" do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end

  it "fails if contents are already wrapped" do
    present = Present.new
    present.wrap("toy")
    expect { present.wrap("toy") }.to raise_error "A contents has already been wrapped."
  end
end
