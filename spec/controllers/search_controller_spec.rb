require "rails_helper"

RSpec.describe SearchController do
  describe "POST create" do
    context "when location is found" do
      let!(:location) { create(:location) }

      it "redirects to location" do
        expect(LocationLookup).to receive(:call).and_return(location)
        post :create, params: {query: "New York"}
        expect(response).to redirect_to(location)
      end
    end

    context "when location is not found" do
      it "redirects to home page" do
        expect(LocationLookup).to receive(:call).and_return(nil)
        post :create, params: {query: "New York"}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
