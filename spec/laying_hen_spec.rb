
require 'laying_hen'

describe LayingHen do
  # LayingHen tests here
  let(:hen){LayingHen.new}

  describe "#initialize" do
    it "creates a new LayingHen" do
      expect(hen).to be_an_instance_of LayingHen
    end
  end

  describe "#age" do
    it "requires hen´s age" do
      hen.age!
      expect(hen.age).to eq(1)
    end
  end

  describe "#any_eggs" do
    it "expect egg after 3 months" do
      4.times do 
        hen.age!
      end
      expect(hen.any_eggs?).to be true # important () for argument
      # {} for block
    end
  end

  describe "#old" do
    context "when the hen its so old to lay eggs" do
      it "expect ancient hen" do
        14.times do 
          hen.age!
        end
        expect(hen.old?).to be true
      end
    end
  end

  describe "#pick_an_egg" do
    it "should raise NoEggsError not layed any eggs" do
      expect{hen.pick_an_egg!}.to raise_error(NoEggsError)
    end
  end

end

describe Egg do
  let(:egg){Egg.new}
  # Egg tests here
  describe "#initialize" do
    it "creates a new Egg" do
      expect(egg).to be_an_instance_of Egg
    end
  end

  describe "#rotten" do
    it "expect any egg rotten" do
      expect(egg.rotten?).to be false
    end
  end

end