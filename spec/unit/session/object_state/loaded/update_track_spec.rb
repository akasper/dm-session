require 'spec_helper'

describe Session::ObjectState::Loaded,'#update_track' do
  let(:object)        { described_class.new(mapper,domain_object) }
  let(:mapper)        { DummyMapper.new                           }
  let(:domain_object) { DomainObject.new(:foo,:bar) }

  let(:track)         { {} }

  subject { object.update_track(track) }

  it 'should add object to track' do
    subject
    track.should == { domain_object => object }
  end

  it 'should return self' do
    subject.should == object
  end
end