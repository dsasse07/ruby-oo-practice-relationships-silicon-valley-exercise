require 'pry'

class VentureCapitalist
    @@all = []
    attr_reader :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{|ven_cap| ven_cap.total_worth > 1000000000}
    end

    def offer_contract(startup_obj, type, investment)
        FundingRound.new(startup_obj, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map(&:startup)
    end

    def biggest_investment
        self.funding_rounds.max_by{|round| round.investment}
    end

    def invested(domain_str)
        matching_rounds = self.funding_rounds.select {|round| round.startup.domain == domain_str}
        matching_rounds.sum {|round| round.investment}
    end
end
