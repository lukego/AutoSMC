module Model

using Gen
using GenParticleFilters

Config = @NamedTuple{}

SMCModel = @NamedTuple{pf_state::ParticleFilterState,
                       config::Config}

end # module Model
