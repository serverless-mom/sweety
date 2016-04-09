require "string_calculator"

describe StringCalculator do
    describe ".add" do
        context "given '4'" do
            it "returns 4" do
                expect(StringCalculator.add("4")).to eql(4)
            end
        end
        context "given an empty string" do
            it "returns zero" do
                expect(StringCalculator.add("")).to eql(0)
            end
        end
    end
end