require 'spec_helper'

describe BlogPostPhoto do
  it { should respond_to :title }
  it { should belong_to :blog_post }
end

