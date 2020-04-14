class Plan #Because we dont intend to having plans table
	PLANS = [:free, :premium]

	def self.options
		PLANS.map { |plan| [ plan.capitalize, plan ] }
	end
end	