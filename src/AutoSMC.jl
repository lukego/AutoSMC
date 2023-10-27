"""
Main module.

# Exports

\$(EXPORTS)
"""


module AutoSMC

using DocStringExtensions

# Main modules.
include("Model.jl")

# Top-level API.
include("api.jl")

end # module AutoSMC
