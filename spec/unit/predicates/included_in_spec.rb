# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#included_in?" do
    let(:predicate_name) { :included_in? }

    context "when value is present in list" do
      let(:arguments_list) do
        [
          [%w[Jill John], "Jill"],
          [%w[Jill John], "John"],
          [1..2, 1],
          [1..2, 2],
          [[nil, false], nil],
          [[nil, false], false]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "with value is not present in list" do
      let(:arguments_list) do
        [
          [%w[Jill John], "Jack"],
          [1..2, 0],
          [1..2, 3],
          [[nil, false], true]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
