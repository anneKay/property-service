# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Properties API" do

  let!(:property) { create(:property) }

  describe "GET /v1/properties" do
    
    context "when valid params are passed in" do
      let(:valid_near_by_property_params) do
        {
          lat: '13.4236807',
          lng: '52.5342963',
          property_type: 'apartment',
          marketing_type: 'sell'
          }
      end

      let(:property_params_for_empty_data) do 
        {
          lng: '10.4236807',
          lat: '32.5342963',
          property_type: 'apartment',
          marketing_type: 'sell'
        }

      end
      it "returns all nearby properties" do
        get "/v1/properties", params: valid_near_by_property_params
        
        result = JSON.parse(response.body)
    
        expect(response).to have_http_status(200)
        expect(response.body).to_not be_empty
        expect(result[0]["street"]).to eq('Prenzlauer Allee')
        expect(result[0]["zip_code"]).to eq('10405')
        expect(result[0]["lat"]).to eq('13.4224666')
        expect(result[0]["lng"]).to eq('52.5346344')
        
      end

      it "returns the right response message for properties outside 5km radius" do
        get "/v1/properties", params: property_params_for_empty_data

        expect(response).to have_http_status(404)
        expect(response.body).to include("No nearby properties found at this time")
      end
    end

    context "when invalid params are passed in" do
      let(:invalid_near_by_property_params) do
        {
          lat: 'invalid_lat',
          lng: 'invalid_lng',
          property_type: 'apartment',
          marketing_type: 'sell'
        }
      end

      it "returns the right error response message" do
        get "/v1/properties", params: invalid_near_by_property_params

        expect(response).to have_http_status(422)
        expect(response.body).to include("is not a number")
      end
    end
  end

end
