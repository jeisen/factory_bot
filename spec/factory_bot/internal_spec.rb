describe FactoryBot::Internal do
  it "finds a registered trait" do
    trait = FactoryBot::Trait.new(:admin)
    FactoryBot::Internal.register_trait(trait)
    expect(FactoryBot::Internal.trait_by_name(trait.name)).to eq trait
  end
end
