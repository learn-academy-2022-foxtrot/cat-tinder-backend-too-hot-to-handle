require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name exists in the db entry" do
    cat = Cat.create(age: 7, enjoys: "eating pickles", image:"https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age exists in the db entry" do
  cat = Cat.create(name: "Pickles", enjoys: "eating pickles", image:"https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys exists in the db entry" do
    cat = Cat.create(name: "Pickles", age: 7, image:"https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
    expect(cat.errors[:enjoys]).to_not be_empty
    end

  it "should validate image exists in the db entry" do
    cat = Cat.create(name: "Pickles", age: 7, enjoys: "eating pickles")
    expect(cat.errors[:image]).to_not be_empty
    end

  it "should validate enjoys is at least 10 characters minimum" do
    cat = Cat.create(name: "Pickles", age: 7, enjoys: "eating", image:"https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end