module Models

using Gen
using GenParticleFilters

Config = @NamedTuple{}

Simulation = @NamedTuple{pf_state::ParticleFilterState,
                       config::Config}

Model = @NamedTuple{e::Expr}

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

# normal(100 + 6 * cores^0.9, sqrt(cores))

#   Constant(k)
# | Variable(v)
# | Add(e1, e2)
# | Mul(e1, e2)

# (NORMAL (+ 3 (* 1.2 CORES)) 5.1)


abst

struct Constant


end # module Models
