# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'square kilometers' do
    subject { Measurement.parse('10 km²') }
    
    it 'converts to hectares' do
      subject.convert_to(:ha).quantity.should eq 1_000
    end
    
    it 'converts to ares' do
      subject.convert_to(:a).quantity.should eq 100_000
    end
    
    it 'converts to square centimeters' do
      subject.convert_to(:cm2).quantity.should eq 100_000_000_000
    end
  end
  
  describe 'hectares' do
    subject { Measurement.parse('10 ha') }
    
    it 'converts to square kilometers' do
      subject.convert_to(:km2).quantity.should eq 0.1
    end
    
    it 'converts to ares' do
      subject.convert_to(:a).quantity.should eq 1_000
    end
    
    it 'converts to square centimeters' do
      subject.convert_to(:cm2).quantity.should eq 1_000_000_000
    end
  end
  
  describe 'ares' do
    subject { Measurement.parse('1000 a') }
    
    it 'converts to square kilometers' do
      subject.convert_to(:km2).quantity.should eq 0.1
    end
    
    it 'converts to hectares' do
      subject.convert_to(:ha).quantity.should eq 10
    end
    
    it 'converts to square centimeters' do
      subject.convert_to(:cm2).quantity.should eq 1_000_000_000
    end
  end
  
  describe 'square centimeters' do
    subject { Measurement.parse('10000000000 cm²') }
    
    it 'converts to square kilometers' do
      subject.convert_to(:km2).quantity.should eq 1
    end
    
    it 'converts to hectares' do
      subject.convert_to(:ha).quantity.should eq 100
    end
    
    it 'converts to ares' do
      subject.convert_to(:a).quantity.should eq 10_000
    end
  end
end
