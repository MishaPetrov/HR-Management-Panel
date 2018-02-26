#!/usr/bin/ruby

class Division < ActiveRecord::Base
  has_many(:employees)
end
