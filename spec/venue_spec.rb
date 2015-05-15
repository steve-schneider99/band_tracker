require('spec_helper')

describe(Venue) do
  it("validates presence of description") do
    task = Venue.new({:name => ""})
    expect(task.save()).to(eq(false))
  end
end
