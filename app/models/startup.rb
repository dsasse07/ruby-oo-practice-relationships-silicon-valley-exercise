require 'pry'

class Startup
    @@all = []
    attr_reader :name, :founder, :domain

    def initialize(name_para, founder_para, domain_para)
        @name = name_para
        @founder = founder_para
        @domain = domain_para
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name_str, domain_str)
        @name = name_str
        @domain = domain_str
    end

    def self.find_by_founder(founder_str)
        Startup.all.find{|startup| startup.founder == founder_str}
    end

    def self.domain
        Startup.all.map(&:domain)
    end

    #FundingRound.new(Startup, VentureCapitalist, type, investment)
    def sign_contract(ven_cap_obj, investment_type, investment)
        FundingRound.new(self, ven_cap_obj, investment_type, investment)
    end

    def num_funding_rounds
        self.investments.count
    end

    def total_funds
        self.investments.sum{|round| round.investment}
    end

    def investors
        self.investments.map(&:venture_capitalist).uniq
    end

    def big_investors
        my_big_investors = self.investors.keep_if{|investor| VentureCapitalist.tres_commas_club.include?(investor) }
        my_big_investors.uniq
    end

    #Helpers
    def investments
        FundingRound.all.select{|round| round.startup == self}
    end

end

