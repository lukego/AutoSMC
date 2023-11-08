module Models

using Gen
using GenParticleFilters
using MacroTools
using DataFrames

Config = @NamedTuple begin
    response_vars::Vector{Symbol};
    fixed_vars::Vector{Symbol};
end

Simulation = @NamedTuple{pf_state::ParticleFilterState,
                       config::Config}

Model = @NamedTuple{e::Expr}

function ismodel(expr)
    @capture(expr, response_ ~ distribution_(parameters__))
end

@gen function model(config::Config, data::DataFrame)
    response ~ oneof(config.response_vars)
    explain ~ oneof(config.fixed_vars)
    σ ~ exponential(1/1000)
    r = data[!,response]
    e = data[!,explain]
    for i in eachindex(r, e)
        {:y=>i} ~ normal(r[i], σ)
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
