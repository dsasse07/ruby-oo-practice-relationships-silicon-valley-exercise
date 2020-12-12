require 'pry'

class FundingRound
    @@all = []
    attr_reader :startup, :venture_capitalist, :type, :investment

    def initialize(startup_obj, ven_cap_obj, type, investment)
        @startup = startup_obj
        @venture_capitalist = ven_cap_obj
        @type = type
        @investment = investment.to_f.abs
        @@all << self
    end

    def self.all
        @@all
    end

end
