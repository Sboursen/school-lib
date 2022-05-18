require_relative '../base_decorator'
require_relative '../nameable'

describe BaseDecorator do
  context "Given a nameable" do
    it "creates a BaseDecorator with the correct parameters" do
      nameable = Nameable.new

      base_decorator = BaseDecorator.new(nameable)

      expect(base_decorator.nameable).to equal(nameable)

    end

    it "can write a new nameable to the @nameable field" do
      nameable = Nameable.new
      new_nameable = Nameable.new

      base_decorator = BaseDecorator.new(nameable)
      base_decorator.nameable = new_nameable

      expect(base_decorator.nameable).to equal(new_nameable)

    end
  end
end
