require 'spec_helper'

describe DataMapper::Session, '#load' do
  subject { object.load(loader) }

  let(:object)        { described_class.new(registry)              }
  let(:mapper)        { registry.resolve_model(Spec::DomainObject) }
  let(:registry)      { Spec::Registry.new                         }
  let(:object)        { described_class.new(registry)              }
  let(:identity)      { mapper.dumper(domain_object).identity      }
  let(:domain_object) { Spec::DomainObject.new                     }

  let(:loader) do
    mock(
      'Loader', 
      :identity => identity, 
      :object => domain_object, 
      :mapper => mapper
    )
  end

  context 'when object is not loaded before' do

    it 'should return loaded object' do
      should be(domain_object)
    end

    it 'should track object' do
      expect { subject }.to change { object.include?(domain_object) }.from(false).to(true)
    end

    it 'should track object dirtyness' do
      subject
      object.dirty?(domain_object).should be(false)
    end
  end

  context 'when object is not loaded before' do
    let(:early_object) { mock('Domain Object') }
    let(:early_loader) do
      mock(
        'Loader',
        :identity => identity,
        :object   => early_object,
        :mapper   => mapper
      )
    end

    before do
      object.load(early_loader)
    end

    it 'should return tracked object' do
      should be(early_object)
    end
  end
end