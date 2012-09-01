require 'spec_helper'

describe RecipePhoto do
  it { should respond_to :title }
  it { should belong_to :recipe }
end

