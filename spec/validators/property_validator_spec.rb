# frozen_string_literal: true

require "rails_helper"

RSpec.describe PropertyValidator do

  describe "Property Validator" do

    let (:valid_property_params) {
      {
        lng: 13.4236807,
        lat: 52.5342963,
        marketing_type: "sell",
        property_type: "apartment"
      }
    }

    let (:invalid_property_params) {
      {
        lng: 'invalid_lng',
        lat: 'invalid_lat',
        marketing_type: "sell",
        property_type: "apartment"
      }
    }

    context "When called with valid input" do
      subject { PropertyValidator.new(valid_property_params) }

      it "should return true for valid params" do
        expect(subject.valid?).to be true
      end

    end

    context "When called with invalid input" do
      subject { PropertyValidator.new(invalid_property_params) }

      it "should return false for invalid input" do
        expect(subject.valid?).to be false
      end

      it "should return the right error messages for invalid input" do
        subject.validate

        expect(subject.errors[:lat]).to include("is not a number")
        expect(subject.errors[:lng]).to include("is not a number")
      end
    end

  end

end
