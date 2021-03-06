require_relative 'project'

RSpec.describe Project do

  before(:each) do
    # updated this block to create two projects
    @project1 = Project.new('Project 1', 'description 1', 'owner1')
    @project2 = Project.new('Project 2', 'description 2', 'owner2')
  end

  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end 

  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2")
  end

  it 'has a getter and setter for owner attribute' do
    @project1.owner = 'Changed Owner'
    expect(@project1.owner).to eq("Changed Owner")
  end

  it 'has a method add_tasks' do
    expect(@project2.add_tasks('set deadline')).to eq(['set deadline'])
  end  

  it 'has a method tasks that returns tasks attribute' do
    @project2.add_tasks('set another deadline')
    expect(@project2.tasks).to eq(['set another deadline'])
  end  

  it 'has a method print_tasks that will print each task in your project' do
    @project2.add_tasks('call molly')
    @project2.add_tasks('call stan')
    expect(@project2.print_tasks).to eq(['call molly', 'call stan'])
  end
  
end