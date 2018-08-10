require 'spec_helper'

describe Valvat::Checksum::RO do
  %w(RO123456789 RO99908 RO19 RO124 RO13182060).each do |valid_vat|
    it "returns true on valid vat #{valid_vat}" do
      expect(Valvat::Checksum.validate(valid_vat)).to be true
    end

    invalid_vat = "#{valid_vat[0..-3]}#{valid_vat[-1]}#{valid_vat[-2]}"

    it "returns false on invalid vat #{invalid_vat}" do
      expect(Valvat::Checksum.validate(invalid_vat)).to be false
    end
  end
end
