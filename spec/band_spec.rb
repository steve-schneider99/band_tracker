require('spec_helper')

describe(Band) do
  it("validates presence of description") do
    task = Band.new({:name => ""})
    expect(task.save()).to(eq(false))
  end
end
