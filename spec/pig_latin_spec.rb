require 'spec_helper'

describe PigLatin do
  
  before :each do
    @pig = PigLatin.new 
  end
  
   describe "#new" do
     it 'returns a new PigLatin object' do
       expect(@pig).to(be_an_instance_of(PigLatin))
     end   
  end
  
  describe "#translate" do
    it 'returns ellohay when given hello' do
      expect(@pig.translate("hello")).to eql "ellohay"
    end

    it 'returns eatyay when given eat' do
      expect(@pig.translate("eat")).to eql "eatyay"
    end

    it 'returns eatyay orldway when given eat world' do
      expect(@pig.translate("eat world")).to eql "eatyay orldway"
    end

    it 'returns Ellohay when given Hello' do
      expect(@pig.translate("Hello")).to eql "Ellohay"
    end

    it 'returns Applesay when given Apples' do
      expect(@pig.translate("Apples")).to eql "Applesyay"
   end

    it 'returns eatay… orldway?! when given eat… world?!' do
      expect(@pig.translate("eat… world?!")).to eql("eatyay… orldway?!")
    end

    it 'returns oolschay when given school' do
      expect(@pig.translate("school")).to eql("oolschay")
    end

    it 'returns uickqay when given quick' do
      expect(@pig.translate("quick")).to eql ("uickqay")
     end
  end
  
end