module Models

using Gen
using GenParticleFilters
using MacroTools

Config = @NamedTuple{response_vars::Vector{Symbol},
                     fixed_vars::Vector{Symbol}}

Simulation = @NamedTuple{pf_state::ParticleFilterState,
                       config::Config}

Model = @NamedTuple{e::Expr}

function ismodel(expr)
    @capture(expr, response_ ~ distribution_(parameters__))
end

@gen function model(config, observations)
    response ~ oneof(config.response_vars)
    #distribution ~ distributions
    μ ~ oneof(config.fixed_vars)
    σ ~ oneof(config.fixed_vars)
    for (i,x) in enumerate(observations)
        {:y=>i} ~ normal(μ, σ)
    end
end

@dist oneof(items) = items[uniform_discrete(1, length(items))]

#=

@gen function model()
end

@gen function normal()
    end

@gen function uniform()
    end

@gen function expr()
end

@gen function constant()
    end

@gen function variable()
    end

@gen function add()
    end

@gen function multiply()
    end

=#

# normal(100 + 6 * cores^0.9, sqrt(cores))

#   Constant(k)
# | Variable(v)
# | Add(e1, e2)
# | Mul(e1, e2)

# (NORMAL (+ 3 (* 1.2 CORES)) 5.1)

end # module Models
