require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Division) do
  describe("#employees") do
    it("tells which employees are in the division") do
      test_d = Division.create({:name => "analytics"})
      test_e1 = Employee.create({:name => "Misha", :division_id => test_d.id})
      test_e2 = Employee.create({:name => "Andrew", :division_id => test_d.id})
     expect(test_d.employees()).to(eq([test_e1, test_e2]))
    end
  end
end
