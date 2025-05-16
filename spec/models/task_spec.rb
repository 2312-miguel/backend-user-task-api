require 'rails_helper'

RSpec.describe Task, type: :model do
  it "es válida con datos válidos" do
    task = build(:task)
    expect(task).to be_valid
  end

  it "no es válida sin título" do
    task = build(:task, title: nil)
    expect(task).not_to be_valid
  end
end
