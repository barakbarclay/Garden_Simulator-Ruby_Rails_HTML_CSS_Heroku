require 'rails_helper'

describe SessionsController do
    describe 'verifyLogin' do
    # create some user to test all over
    bob = User. new
    
        it "Will return true when given a valid user whose password matches the password field" do
            expect(SessionsController.verifyLogin(bob)).to  eql(true)
        end
    end
end